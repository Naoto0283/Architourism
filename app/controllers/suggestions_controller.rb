class SuggestionsController < ApplicationController
  def index;end

  def result
    category_id = params[:category_id]
    prefecture_id = params[:prefecture_id]
    free_word = params[:free_word]

    # 各ステップの未入力チェック
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

    # Spotデータから条件に合う候補を取得
    spots = Spot.where(category_id: category_id, prefecture_id: prefecture_id)

    # 登録されているスポットが存在しない場合の処理
    if spots.empty?
      flash[:alert] = "条件に一致するおすすめスポットは見つかりませんでした。"
      redirect_to suggestions_path and return
    end

    # 取得したデータをAIで分析するためにテキスト化
    spot_names = spots.pluck(:name).join(', ')
    category_name = Category.find(category_id).name
    prefecture_name = Prefecture.find(prefecture_id).name

    require 'google/apis/customsearch_v1'
    search_service = Google::Apis::CustomsearchV1::CustomSearchAPIService.new
    search_service.key = ENV['GOOGLE_SEARCH_API_KEY']

    # 検索クエリを作成
    query = "文化財建築 #{spot_names} #{prefecture_name} #{category_name} #{free_word}"

    search_result = search_service.list_cses(
      cx: ENV['GOOGLE_CSE_ID'],
      q: query,
      num: 5
    )

    # 検索結果をテキスト化
    web_info = search_result.items&.map do |item|
      "#{item.title}: #{item.snippet}"
    end&.join("\\n") || "インターネットからの情報が見つかりませんでした。"

    prompt_text = <<~TEXT
      ユーザーから以下の情報が入力されました：
      カテゴリー: #{category_name}
      都道府県: #{prefecture_name}
      要望: #{free_word}

      さらに、インターネットから取得した情報は以下の通りです：
      #{web_info}
      これらの情報と、以下の場所リストを基に、おすすめを1つ選び、400字程度で理由も説明してください。最後まで書いてください：
      #{spot_names}
    TEXT
    
    # OpenAI APIの呼び出し
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt_text }],
        max_tokens: 300
      }
    )

    # AIの返答結果
    @ai_response = response.dig("choices", 0, "message", "content") || "診断結果が取得できませんでした。"

    render :result
  end
end
