# Architourism - 文化財 建造物 検索サービス -

### サービスurl : https://www.japan-architourism.com/

## サービス概要

日本の文化財の建造物を地図上で検索できるサービスです。 
- 現在の位置情報から、近くの建造物を探すことができます。 
- ログインをすると、建造物のブックマーク、口コミの投稿、AIによるおすすめ機能利用ができるようになります。

## このサービスへの思い・作りたい理由

- 私は文化財の建造物を巡る旅を趣味としており、旅の際には市町村や文化財一覧のHPをネット検索で調査していたのですが、「もう少し簡単に調べられるアプリケーションが欲しい」と感じたのがサービス作成のきっかけでした。

また、下記のような課題を感じ、それを改善できるサービス作成をすることを決めました。

- 正確に調べる場合、市町村ごとのHPで文化財一覧を調べなくてはならず、情報に辿り着くまでに手間がかかること。 
- 建築愛好家で旅に出る方が多く存在するにも関わらず(建造物関連の投稿にいいねが200ついていることも珍しくない)、 簡単に調べられるアプリケーションが存在しない。 
- 利用者の生の声(口コミ)は、SNSやGoogle Mapのレビューなどを見に行かないと確認できない。

## ユーザー層について

- 主に国内の建築愛好家

 - 理由：文化財の建造物を目的に旅をする方々は、SNS上でも非常に多く見られます。 また、簡単に情報を調べられるアプリケーションが存在しないため、建築愛好家にとって大きな需要があると感じました。

## サービスの利用イメージ 

- マップ上で文化財の建造物がわかります。地名などから周辺の場所を検索することもできます。これにより、簡単に文化財の建造物を調べることができます。

- 口コミを検索できます。他のユーザーが投稿した口コミを閲覧できます。これにより、訪問者の生の声が手に入ります。

- 建造物のブックマークを登録できます。これにより、旅の際に訪問する予定の建造物の確認が簡単になります。

- AIによるおすすめ診断を利用できます。これにより、おすすめの建築物を知ることができます。

## サービスの差別化ポイント・推しポイント

差別化ポイントは他のユーザーが投稿した口コミを閲覧できることです。 訪問者の生の声(口コミ)は、SNSやGoogle Mapのレビューなどを見に行かないと確認できませんが、 このアプリケーション上では簡単に確認することができます。

- 類似性のあるサービス : https://bunkazai-map.colour-field.jp/

- サービスの推しとなるポイントは、3つあります。 
 - 1つ目がマップを利用した確認のしやすさです。地図上でピンをたて、どこにあるか分かりやすくしています。
 - 2つ目が口コミの投稿です。利用者の生の声(口コミ)をアプリケーション上で簡単に手に入れることができます。 
 - 3つ目がAI診断機能です。診断用のフォームにより、おすすめの建造物が分かるようになります。

## 機能候補
### 【メイン機能(ユーザー登録不要)】 
 - (1) 場所検索：現在地を取得し、周辺施設をマップ表示 
 - (2) 一覧検索：「建築名」「地域」での施設情報の絞り込み 
 - (3) 口コミ検索：「投稿内容」で口コミ検索 
 - (4) 建築情報表示：「建築名」 / 口コミ 表示

### 【サブ機能(ユーザー登録必要)】 
 - (5) ブックマーク 
 - (6) AI診断機能 
 - (7) マイページ：プロフィール情報/ブックマーク一覧表示 

### 【その他】 
- Google認証によるユーザー登録・ログイン機能

## 技術スタック

| カテゴリ       | 技術スタック                                                              | 
| -------------- | ------------------------------------------------------------------------- | 
| フロントエンド | Rails 7.2.2.1(Hotwire/Turbo/Stimulus), JavaScript, Tailwind CSS, daisyUI | 
| バックエンド   | Rails 7.2.2.1(Ruby3.3.6)                                                | 
| データベース   | PostgreSQL                                                                | 
| インフラ       | Render.com                                                      | 
| 開発環境       | Docker                                                                    | 
| 認証           | Sorcery, Googleログイン                                                   | 
| API            | Google Maps API, OpenAI API, Google Custom Search API                                         | 
