Rails.application.routes.draw do
  root to: 'home#index'
  resources :departments
  resources :records
  resources :nurses
  resources :doctors
  resources :pharmacists
  devise_for :users
  resources :frontdesk
  resources :home, only: [:index] do 
    collection do
      get :admin
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
