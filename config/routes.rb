Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :tastings, only: [:index, :show, :create]
end
