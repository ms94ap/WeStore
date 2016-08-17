Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :posts, only: [:show, :index] 
  end

  namespace :admin do
    resources :categories
  end

  resources :products

  root to: "welcome#index"

end
