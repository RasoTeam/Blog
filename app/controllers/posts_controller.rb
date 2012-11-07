class PostsController < ApplicationController
  before_filter :signed_in_user, :only => [ :create, :destroy]

  def edit
    if signed_in?
      @cat_zip = Category.pluck( :name).zip( Category.pluck( :id).map(&:to_s))
      @post = Post.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post]) 
      redirect_to @post.category
    else
      render 'edit'   
    end
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
  
  def search
    q = params[:post][:content]
    @post = Post.find( :all, :conditions => ["content LIKE ?", q])
  end
   
  def destroy
    if signed_in? 
      @post = Post.find(params[:id])
      c = @post.category_id
      @post.destroy
      redirect_to category_path(c)
    else
      redirect_to root_path
    end
  end

  def index
    @posts = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end
end
