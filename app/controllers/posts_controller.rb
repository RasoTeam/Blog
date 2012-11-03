class PostsController < ApplicationController
  before_filter :signed_in_user, :only => [ :create, :destroy]

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def new
    if signed_in?
      @cat_zip = Category.pluck( :name).zip( Category.pluck( :id).map(&:to_s))
      @post = Post.new
    else
      redirect_to root_path
    end
  end
  
  def create
    @category = Category.find(params[:post][:category_id])
    @post = @category.posts.create(params[:post])
    @post.user_id = current_user.id
    if @post.save 
      redirect_to @category
    else 
      render 'new'
    end
  end
   
  def destroy
    @post = Post.find(params[:id])
    c = @post.category_id
    @post.destroy
    redirect_to category_path(c)
  end
end
