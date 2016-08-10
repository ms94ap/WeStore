Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :products, only: [:show] #testing routes


  root to: "welcome#index"


end
