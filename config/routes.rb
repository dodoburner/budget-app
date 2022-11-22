Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :groups
  resources :purchases
  root "users#index"
  devise_for :users, path: ''
end
