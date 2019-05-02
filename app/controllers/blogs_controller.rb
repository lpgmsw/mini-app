class BlogsController < ApplicationController

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to action: :index
  end

  private
  def blog_params
    params.require(:blog).permit(:name, :text).merge(user_id: current_user.id)
  end
end
