Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  root to: 'items#index'
end
