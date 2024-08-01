Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  resources :products do
    resource :buy_now, only: [:show], controller: :buy_now
  end

  resource :admin, only: [:show], controller: :admin

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'products#index'
end
