Rails.application.routes.draw do
  get 'items/index'

  get 'items/new'

  get 'items/create'

  devise_for :users

  resources :users, only: [:show]
   
  resources :items
 
  authenticated :user do
    root 'items#index', as: :authenticated_root
  end

  root 'welcome#index'

end
