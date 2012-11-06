class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end

end
