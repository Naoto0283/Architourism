# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# カテゴリーの初期データ
Category.create!(
  [
    { name: '寺' },
    { name: '神社' },
    { name: '住宅' },
    { name: '茶室' },
    { name: '城郭' },
    { name: '公共建築' },
    { name: '産業建築' },
    { name: '交通関連建築' }
  ]
)
