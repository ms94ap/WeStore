Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :posts do
      resources :products
    end
  end




  root to: "welcome#index"


end
