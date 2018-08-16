Rails.application.routes.draw do
  resources :records
  resources :frontdesk
  devise_for :users
  
  root to: 'home#index'

  resources :home, only: [:index] do
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
