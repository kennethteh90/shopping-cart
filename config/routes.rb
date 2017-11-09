Rails.application.routes.draw do

  root to: 'products#index'

  devise_for :admins
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :categories, only: [:index, :show]

  resources :products, only: [:index, :show]

  namespace :admin do
    root to: 'products#index'
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  end

end
