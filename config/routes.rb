Rails.application.routes.draw do
  namespace :api do
    resources :categories
    resources :stores
    resources :products, only: %i(index show)
    resources :carts
    resources :orders
    resources :rates, only: :create
    resources :permissions, only: :index
    resources :notifications, only: %i(index update)
    scope module: "store_owner", path: "dashboard" do
      resources :stores
      resources :stores do
        resources :products
        resources :orders
      end
    end
    scope module: "shippers", path: "dashboard" do
      resources :shippers, only: %i(show update)
      resources :shipper_orders
      resources :devices, only: %i(create destroy)
      get "/shipper_orders/:order_id/exists", to: "shipper_orders#exists"
    end
  end

  scope "/api" do
    post "/login", to: "authentication#login"
    delete "/logout", to: "authentication#logout"
    patch "/refresh", to: "authentication#refresh_token"
    post "/signup", to: "users#create"
    patch "/profile", to: "users#update"
    patch "users/password", to: "users#password"
  end
  resources :test, only: :index
  get "/shippers", to: "test#shippers"
  # mount ActionCable.server => "/cable"
end
