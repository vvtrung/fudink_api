Rails.application.routes.draw do
  namespace :api do
    resources :categories, only: %i(index show)
    resources :stores, only: %i(index show)
    resources :products, only: :show
    resources :carts
  end
  post "api/login", to: "authentication#login"
  delete "api/logout", to: "authentication#logout"
  patch "api/refresh", to: "authentication#refresh_token"
  post "api/signup", to: "users#create"
end
