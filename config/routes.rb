Rails.application.routes.draw do
  namespace :api do
    resources :categories, only: %i(index show)
    resources :stores, only: %i(index show create)
    resources :products, only: :show
    resources :carts, only: %i(index create update destroy)
    scope module: "store_owner", path: "dashboard" do
      resources :stores, only: %i(index show update)
      resources :stores do
        resources :products, only: %i(create update destroy)
        resources :orders
      end
    end
  end
  scope "/api" do
    post "/login", to: "authentication#login"
    delete "/logout", to: "authentication#logout"
    patch "/refresh", to: "authentication#refresh_token"
    post "/signup", to: "users#create"
  end
  scope "/api" do
    post "/login", to: "authentication#login"
    delete "/logout", to: "authentication#logout"
    patch "/refresh", to: "authentication#refresh_token"
    post "/signup", to: "users#create"
  end
end
