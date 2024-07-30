Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admin/sessions' }
  resources :products
  resource :admin, only: [:show], controller: :admin

  get "up" => "rails/health#show", as: :rails_health_check

  root "products#index"

  delete 'logout', to: 'sessions#destroy'
end
