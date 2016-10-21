Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
 
  get '/posts', to: "posts#index"

  resources :users do
    resources :posts 
  end

  resources :posts do
  	resources :comments
  end

  namespace :admin do
    resources :categories
  end

  resources :products

  
  root to: "welcome#index"

end
