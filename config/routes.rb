Rails.application.routes.draw do
  resources :users
  root 'index#index'

  # resources :tests

  resources :trials, only: [:index, :show]

  resources :index, only: :index
end
