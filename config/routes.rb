Rails.application.routes.draw do # rubocop:disable Style/FrozenStringLiteralComment
  resources :categories
  devise_for :admins
  resources :products do
    resource :buy_now, only: [:show, :create], controller: :buy_now do # rubocop:disable Style/SymbolArray
      get "success", on: :collection
    end
  end

  resource :admin, only: [:show], controller: :admin

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'products#index'
end
