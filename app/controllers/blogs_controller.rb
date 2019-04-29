class BlogsController < ApplicationController

  def index
    @blogs = Blog.all.order("id DESC")
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
