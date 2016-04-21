Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show]
   
  resources :items
 
  authenticated :user do
    root 'items#index', as: :authenticated_root
  end

  root 'welcome#index'

end
