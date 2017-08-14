Rails.application.routes.draw do
  resources :blogs
  root :to => 'skills#index'
  
  resources :skills do
    resources :projects
  end
end
