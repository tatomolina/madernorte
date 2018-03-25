Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :orders
  resources :clients
  resources :areas
  root 'orders#index'
  get '/order/:id/worker_edit', to: 'orders#worker_edit', as: 'worker_order_edit'
  get '/order/:id/worker_show', to: 'orders#worker_show', as: 'worker_order_show'
  get '/order/worker_index', to: 'orders#worker_index', as: 'worker_order_index'
end
