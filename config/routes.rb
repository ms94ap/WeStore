Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
 

  resources :users do
    resources :posts 
  end

  namespace :admin do
    resources :categories
  end

  resources :products

  
  root to: "welcome#index"

end
