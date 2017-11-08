Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :categories, only: [:index, :show]

  resources :products, only: [:index, :show]

end
