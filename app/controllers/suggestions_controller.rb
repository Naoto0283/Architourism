class SuggestionsController < ApplicationController
  def index;end

  def result
    category_id = params[:category_id]
    prefecture_id = params[:prefecture_id]
    free_word = params[:free_word]

    # Spotデータから条件に合う候補を取得
    spots = Spot.where(category_id: category_id, prefecture_id: prefecture_id)

    # 取得したデータをAIで分析するためにテキスト化
    spot_names = spots.pluck(:name).join(', ')
    prompt_text = <<~TEXT
      ユーザーから以下の情報が入力されました：
      カテゴリー: #{Category.find(category_id).name if category_id.present?}
      都道府県: #{Prefecture.find(prefecture_id).name if prefecture_id.present?}
      要望: #{free_word}

      これに基づいて、以下の場所からおすすめを1つ選び、理由も説明してください：
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
