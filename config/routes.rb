Rails.application.routes.draw do
  resources :remote_labs

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
