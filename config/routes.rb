Rails.application.routes.draw do
  resources :users
  root 'index#index'

  resources :trials, only: [:index, :show]

  resources :index, only: :index

  get "/admin/trials/pending", to: "trials#pending"
  get "/admin/trials/pending/#{:id}", to: "trials#approve"
end
