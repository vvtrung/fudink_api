Rails.application.routes.draw do
  namespace :api do
    resources :categories, only: %i(index show)
    resources :stores, only: %i(index show create)
    resources :products, only: :show
    resources :carts, only: %i(index create update destroy)
    resources :orders, only: %i(index create)
    scope module: "store_owner", path: "dashboard" do
      resources :stores, only: %i(index show update)
      resources :stores do
        resources :products
        resources :orders
      end
    end
    scope module: "shippers", path: "dashboard" do
      resources :shippers, only: :update
      resources :shipper_orders, only: %i(index show update)
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
