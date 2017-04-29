Rails.application.routes.draw do
  root 'index#index'

  # resources :tests

  resources :trials, only: [:index, :show]

  resources :index, only: :index
end
