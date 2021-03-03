Rails.application.routes.draw do
  get 'buyers/index'
  devise_for :users
  root to: "items#index"
  resources :items do
  resources :buyers, only: [:new, :create]
  end
end
