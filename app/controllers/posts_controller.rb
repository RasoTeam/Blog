class PostsController < ApplicationController
  before_filter :signed_in_user, :only => [ :create, :destroy]
  
  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
  end
  
  def create
    @category = Category.find(params[:category_id])
    @posts = @category.posts.create(params[:post])
    if @posts.save 
      redirect_to @category
    else 
      render 'new'
    end
  end
   
end
