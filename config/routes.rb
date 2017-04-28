Rails.application.routes.draw do
  root 'index#index'

  resources :tests
  
  resources :trials, only: :index

  resources :index
end
