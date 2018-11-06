Rails.application.routes.draw do
  root to: 'home#index'
  resources :appointments
  resources :diseases
  resources :departments
  resources :records
  resources :nurses
  resources :doctors
  resources :pharmacists
  devise_for :users
  resources :frontdesk
  resources :home, only: [:index] do 
    collection do
      get :admin, :personnels,:download_data, :show_personnel
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
