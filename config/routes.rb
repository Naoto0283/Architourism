Rails.application.routes.draw do
  get "oauths/oauth"
  get "oauths/callback"

  root "static_pages#top"

  resources :users, only: %i[new create]

  resources :profiles, only: [:index]

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" 

  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  get 'spots/map'

  resources :spots, only: %i[index show] do
    resources :reviews, only: %i[new create edit destroy], shallow: true
    collection do
      get :bookmarks
      get :auto_search
    end
  end

  resources :bookmarks, only: %i[create destroy]

  resources :reviews, only: %i[index]

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