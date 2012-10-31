class PostsController < ApplicationController
  before_filter :signed_in_user, :only => [ :create, :destroy]
  
  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def new
    if signed_in?
      @category = Category.find(params[:category_id])
    else
      redirect_to root_path
    end
  end
  
  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.create(params[:post])
    @post.user_id = current_user.id
    if @post.save 
      redirect_to @category
    else 
      render 'new'
    end
  end
   
end
