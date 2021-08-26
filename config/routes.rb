Rails.application.routes.draw do
  get 'participations/hostsdashboards'
  devise_for :users
  root to: 'pages#home'

  resources :tastings, only: [:index, :show, :new, :create] do
    resources :participations, only: :create
  end
  resources :participations, only: :update
  resources :hosts, only: :show
  resource :dashboard, only: :show
end
