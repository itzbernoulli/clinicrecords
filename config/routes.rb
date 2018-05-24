Rails.application.routes.draw do
  resources :searches
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

    collection do
      post :review
      get  :profile
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
