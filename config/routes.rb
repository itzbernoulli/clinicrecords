Rails.application.routes.draw do
  resources :ratings
  resources :reviews
  resources :merchants
  resources :categories
  resources :roles
  devise_for :users
  
  root to: 'static#index'

  resources :static, only: [:index] do
  	member do
  		get :merchants, :merchant
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
