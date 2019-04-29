class BlogsController < ApplicationController

  def index
    @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
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
    params.require(:blog).permit(:text)
  end

end
