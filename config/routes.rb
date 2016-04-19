Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users

  resources :users, only: [:show]

  root 'welcome#index'

end
