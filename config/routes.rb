Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :orders
  resources :clients
  resources :areas
  root 'orders#index'
end
