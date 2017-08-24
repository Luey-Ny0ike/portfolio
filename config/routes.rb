Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'skills#index'

  resources :skills do
    resources :projects
  end

  resources :blogs do
    resources :comments
  end
end
