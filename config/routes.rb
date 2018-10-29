Rails.application.routes.draw do
  resources :appointments
  resources :diseases
  root to: 'home#index'
  resources :departments
  resources :records
  resources :nurses
  resources :doctors
  resources :pharmacists
  devise_for :users, :controllers => {:registrations => "users"}
  resources :frontdesk
  resources :home, only: [:index] do 
    collection do
      get :admin, :personnels
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
