Rails.application.routes.draw do
  devise_for :admins
  resources :products
  resource :admin, only: [:show], controller: :admin

  get "up" => "rails/health#show", as: :rails_health_check

  root "products#index"
end
