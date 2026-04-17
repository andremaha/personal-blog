Rails.application.routes.draw do
  root "posts#index"

  get "feed", to: "feeds#show", defaults: { format: :rss }

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "/:slug", to: "posts#show", as: :post

  namespace :admin do
    resources :posts, param: :slug, except: :show
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
