Rails.application.routes.draw do
  resources :notices
  resources :meetings
  resources :maintenances
  resources :reservations
  resources :common_areas
  resources :expenses
  resources :suppliers
  resources :incidences
  resources :receipts
  resources :cash_balances
  resources :properties
  resources :communities

  devise_for :users
  resources :users, only: [:index]   

  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboard#index"
end