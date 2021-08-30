Rails.application.routes.draw do
  get 'participations/hostsdashboards'
  devise_for :users
  root to: 'pages#home'

  resources :tastings, only: [:index, :show, :new, :create] do
    resources :participations, only: :create
  end

  resources :conversations, only: :index, param: :other_user_id do 
    resources :messages, only: :create
  end

  resources :participations, only: :update
  resources :hosts, only: :show
  resource :dashboard, only: :show
end
