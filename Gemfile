source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.2", ">= 7.2.2.1"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
#ページ遷移や部分更新を高速化するためのGem
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# GooglePlacesAPIを使用、条件つき検索、店舗情報などの取得のためのgem
gem 'google_places'
# GeoderdingAPIを使用、緯度経度から住所を取得、現在地を取得するためのgem
gem 'geocoder'
# Google Places APIを利用、オートコンプリート機能、インフォウィンドウの表示などのためのgem
gem 'gmaps4rails'

#ページネーション機能
gem 'kaminari'

# 検索機能を実装するためのgem
gem 'ransack'

# ユーザー認証機能を提供するgem
gem "sorcery"

#OpenAIAPIを使用、OpenAIのAPIをRubyで利用するためのGem
gem 'ruby-openai'

# Railsアプリケーションで設定情報を管理する(APIキーやコールバックURLなど、環境ごとに異なる設定を行いたい場合)ためのgem
gem 'config'

#カスタマイズした検索機能を実装するためのGem 
gem 'google-apis-customsearch_v1'

# 秘匿情報保護用のgem
gem 'dotenv-rails', groups: [:development, :test]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  #RSpecを使ってテストを書くためのgem
  gem 'rspec-rails'

  #RSpec用のテストデータ作成するためのgem
  gem 'factory_bot_rails'
  
  #Rspec用のテストデータをランダムに作成するためのgem
  gem 'faker'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
