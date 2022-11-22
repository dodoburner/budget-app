Rails.application.routes.draw do
  resources :groups
  resources :purchases
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, path: ''
  resources :users
end
