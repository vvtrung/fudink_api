Rails.application.routes.draw do
  namespace :api do
    resources :categories, only: %i(index show)
    resources :stores
  end
  post 'auth/login', to: 'authentication#login'
  delete 'auth/logout', to: 'authentication#logout'
  patch 'auth/refresh', to: 'authentication#refresh_token'
  post 'signup', to: 'users#create'
end
