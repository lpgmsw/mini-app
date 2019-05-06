Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  post "blogs/:blog_id" => "blogs#destroy"
  resources :blogs, only: [:create, :new, :index, :destroy]
  resources :users, only: [:edit, :update]
end
