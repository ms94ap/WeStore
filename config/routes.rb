Rails.application.routes.draw do
  resources :users, :only => [:new]

  root to: "welcome#index"


end
