Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :posts 
  end

  namespace :admin do
    resources :categories
  end

  resources :products

  #devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root to: "welcome#index"

end
