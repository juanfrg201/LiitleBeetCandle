Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :products, only: [:index, :new, :create]
  resources :sales, only: [:new, :create]
  resources :admin_dahsboard, only: [:index]

end
