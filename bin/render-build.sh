#!/usr/bin/env bash
set -o errexit  # スクリプトがエラーになった場合に終了する設定

# RubyGemsのインストール
bundle install

# アセットのプリコンパイルとクリーンアップ
bundle exec rake assets:precompile
bundle exec rake assets:clean

# データベースマイグレーション
bundle exec rake db:migrate
