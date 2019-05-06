Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  post 'blogs/:blog_id' => 'blogs#destroy'
  get 'blogs/:blog_id/edit' => 'blogs#edit'
  patch 'blogs/:blog_id' => 'blogs#update'
  resources :blogs, only: [:create, :new, :index, :destroy, :edit]
  resources :users, only: [:edit, :update]
end
