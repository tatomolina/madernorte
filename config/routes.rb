Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :orders
  resources :clients
  resources :areas
  root 'orders#index'
  get '/order/:id/worker_edit', to: 'orders#worker_edit', as: 'worker_order_edit'
end
