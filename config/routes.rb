Rails.application.routes.draw do

  devise_for :users
  resources :users, :only => [:new]

  root to: "welcome#index"


end
