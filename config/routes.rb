Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :destroy]

end
