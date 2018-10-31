Rails.application.routes.draw do
  namespace :api do
    resources :categories
    resources :stores
    resources :products, only: :show
    resources :carts
    resources :orders
    resources :rates, only: :create
    resources :permissions, only: :index
    scope module: "store_owner", path: "dashboard" do
      resources :stores
      resources :stores do
        resources :products
        resources :orders
      end
    end
    scope module: "shippers", path: "dashboard" do
      resources :shippers, only: :update
      resources :shipper_orders
      resources :devices, only: %i(create destroy)
    end
  end

  scope "/api" do
    post "/login", to: "authentication#login"
    delete "/logout", to: "authentication#logout"
    patch "/refresh", to: "authentication#refresh_token"
    post "/signup", to: "users#create"
    patch "/profile", to: "users#update"
  end
end
