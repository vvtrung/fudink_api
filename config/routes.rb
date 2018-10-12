Rails.application.routes.draw do
  namespace :api do
    resources :categories, only: %i(index show)
    resources :stores, only: %i(index show)
    resources :products, only: :show
    resources :carts
  end
  scope "/api" do
    post "/login", to: "authentication#login"
    delete "/logout", to: "authentication#logout"
    patch "/refresh", to: "authentication#refresh_token"
    post "/signup", to: "users#create"
  end
end
