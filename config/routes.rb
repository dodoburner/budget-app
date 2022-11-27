Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :groups, except: [:show] do
    resources :purchases, except: [:show, :update, :edit]
  end
  devise_for :users, path: ''

  authenticated :user do
    root "groups#index", as: :groups_path
  end
  root "users#index"  
end
