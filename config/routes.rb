Rails.application.routes.draw do
  devise_for :users
  get 'blogs' => 'blogs#index'
  resources :users, only: [:edit, :update]
end
