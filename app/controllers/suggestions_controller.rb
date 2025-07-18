class SuggestionsController < ApplicationController
  def index;end

  def result
    category_id = params[:category_id]
    prefecture_id = params[:prefecture_id]
    free_word = params[:free_word]

    if category_id.blank?
      flash[:alert] = "カテゴリーが未選択です"
      redirect_to suggestions_path and return
    elsif prefecture_id.blank?
      flash[:alert] = "都道府県が未選択です"
      redirect_to suggestions_path and return
    elsif free_word.blank?
      flash[:alert] = "自由記述を入力してください"
      redirect_to suggestions_path and return
    end

    spots = Spot.where(category_id: category_id, prefecture_id: prefecture_id)

    if spots.empty?
      flash[:alert] = "条件に一致するおすすめスポットは見つかりませんでした。"
      redirect_to suggestions_path and return
    end

    spot_names = spots.pluck(:name).shuffle.join(', ')
    category_name = Category.find(category_id).name
    prefecture_name = Prefecture.find(prefecture_id).name

    require 'google/apis/customsearch_v1'
    search_service = Google::Apis::CustomsearchV1::CustomSearchAPIService.new
    search_service.key = ENV['GOOGLE_SEARCH_API_KEY']

    query = "文化財建築 #{spot_names} #{prefecture_name} #{category_name} #{free_word}"

    search_result = search_service.list_cses(
      cx: ENV['GOOGLE_CSE_ID'],
      q: query,
      num: 5
    )

    web_info = search_result.items&.map do |item|
      "#{item.title}: #{item.snippet}"
    end&.join("\\n") || "インターネットからの情報が見つかりませんでした。"

    prompt_text = <<~TEXT
      あなたは建築に詳しい観光案内AIです。

      ユーザーから以下の情報が入力されました：
      カテゴリー: #{category_name}
      都道府県: #{prefecture_name}
      要望（特に重視してほしい点）: #{free_word}

      さらに、インターネットから取得した情報は以下の通りです：
      #{web_info}
      以下のスポットリストから、ユーザーの要望に最も合致するものを1つ選んでください。
      特に、「#{free_word}」という要望に合致しているかを重視してください。

      スポット候補一覧: #{spot_names}

      選んだ理由を必ず200字程度で説明してください。
      説明の初めには先に選んだスポットの名前を出してください。
    TEXT
    
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt_text }],
        max_tokens: 300
      }
    )

    @ai_response = response.dig("choices", 0, "message", "content") || "診断結果が取得できませんでした。"

    render :result
  end
end
