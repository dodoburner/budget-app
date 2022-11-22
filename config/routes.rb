Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :groups, except: [:show] do
    resources :purchases, except: [:show]
  end
  root "users#index"
  devise_for :users, path: ''
end
