Rails.application.routes.draw do
  get "oauths/oauth"
  get "oauths/callback"

  #トップページのルーティング
  root "static_pages#top"

  #ユーザー登録のルーティング
  resources :users, only: %i[new create]

  # プロフィール関連のルート
  resources :profiles, only: [:index]

  # OAuth認証のコールバックを処理するルーティング（認証プロバイダからのリダイレクトを受け取る）
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" 

  # 指定されたプロバイダ（GoogleやFacebookなど）でOAuth認証を開始するルーティング
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  #ログイン/ログアウト機能のルーティング
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  # 場所検索ページのルーティング
  get 'spots/map'

  # 一覧検索ページのルーティング
  resources :spots, only: %i[index show] do
    resources :reviews, only: %i[new create edit destroy], shallow: true
    collection do
      # ブックマーク一覧表示用のルーティング
      get :bookmarks
    end
  end

  # ブックマーク機能用のルーティング
  resources :bookmarks, only: %i[create destroy]

  #口コミ検索ページのルーティング
  resources :reviews, only: %i[index]

  #AI診断ページのルーティング
  resources :suggestions, only: %i[index] do
    collection do
      get :result
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
