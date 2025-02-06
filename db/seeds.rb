# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# カテゴリーのデータ
categories = [
  { name: '寺' },
  { name: '神社' },
  { name: '住宅' },
  { name: '茶室' },
  { name: '城郭' },
  { name: '公共建築' },
  { name: '産業建築' },
  { name: '交通関連建築' }
]

# カテゴリを作成または検索
categories.each do |category|
  Category.find_or_create_by!(name: category[:name])
end

# 都道府県のデータ
prefectures = [
  { name: '北海道' },
  { name: '青森県' },
  { name: '岩手県' },
  { name: '宮城県' },
  { name: '秋田県' },
  { name: '山形県' },
  { name: '福島県' },
  { name: '茨城県' },
  { name: '栃木県' },
  { name: '群馬県' },
  { name: '埼玉県' },
  { name: '千葉県' },
  { name: '東京都' },
  { name: '神奈川県' },
  { name: '新潟県' },
  { name: '富山県' },
  { name: '石川県' },
  { name: '福井県' },
  { name: '山梨県' },
  { name: '長野県' },
  { name: '岐阜県' },
  { name: '静岡県' },
  { name: '愛知県' },
  { name: '三重県' },
  { name: '滋賀県' },
  { name: '京都府' },
  { name: '大阪府' },
  { name: '兵庫県' },
  { name: '奈良県' },
  { name: '和歌山県' },
  { name: '鳥取県' },
  { name: '島根県' },
  { name: '岡山県' },
  { name: '広島県' },
  { name: '山口県' },
  { name: '徳島県' },
  { name: '香川県' },
  { name: '愛媛県' },
  { name: '高知県' },
  { name: '福岡県' },
  { name: '佐賀県' },
  { name: '長崎県' },
  { name: '熊本県' },
  { name: '大分県' },
  { name: '宮崎県' },
  { name: '鹿児島県' },
  { name: '沖縄県' }
]

# 都道府県を作成または検索
prefectures.each do |prefecture|
  Prefecture.find_or_create_by!(name: prefecture[:name])
end
