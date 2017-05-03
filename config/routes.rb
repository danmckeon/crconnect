Rails.application.routes.draw do
  root 'index#index'
  resources :index, only: :index
  resources :trials, only: [:index, :show]
  resources :users

  get '/admin', to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
end
