class BlogsController < ApplicationController

   before_action :authenticate_user!, except: :index

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:name, :text).merge(user_id: current_user.id)
  end
end
