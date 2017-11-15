Rails.application.routes.draw do

  get 'carts/show'

  root to: 'products#index'

  devise_for :admins
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :categories, only: [:index, :show]

  resources :products, only: [:index, :show]

  namespace :admin do
    root to: 'products#index'
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :photos, only: [:new, :create, :destroy]
    resources :orders, only: [:index] do
      put '/completed', to: 'orders#completed'
    end
  end

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'change/:product_id', to: 'carts#change', as: :change
  end

  resources :transactions, only: [:new, :create]

end
