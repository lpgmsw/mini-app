Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  get 'blogs' => 'blogs#index'
  resources :users, only: [:edit, :update]
end
