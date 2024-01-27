Rails.application.routes.draw do
  get "salepdf/:id", to: "sale_pdfs#salepdf", as: 'salepdf'
  root 'sessions#new'
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :products, only: [:index, :new, :create]
  resources :sales, only: [:new, :create, :show]
  resources :admin_dahsboard, only: [:index]

end
