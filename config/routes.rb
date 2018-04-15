Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :clients, only: [:index, :show, :new, :create, :edit, :update]
  resources :areas, only: [:index, :show]
  resources :notes, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :orders
  resources :delivery_items
  resource :carts, only: [:show]
  get '/order/:id/worker_edit', to: 'orders#worker_edit', as: 'worker_order_edit'
  get '/order/:id/worker_show', to: 'orders#worker_show', as: 'worker_order_show'
  get '/order/worker_index', to: 'orders#worker_index', as: 'worker_order_index'
  root 'orders#index'
end
