Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :products, only: [:index, :show, :new, :create] #testing routes


  root to: "welcome#index"


end
