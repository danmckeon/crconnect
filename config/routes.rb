Rails.application.routes.draw do
  resources :tests

  resources :trials, only: :index

end
