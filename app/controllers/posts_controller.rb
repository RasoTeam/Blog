class PostsController < ApplicationController
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
