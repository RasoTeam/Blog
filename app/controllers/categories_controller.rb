class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end

  def index
    @categories = Category.all
  end

  def new
    if signed_in?
      @category = Category.new
    end
  end

  def create
    if signed_in?
      @category = Category.new(params[:category])
      if @category.save
        redirect_to root_path
      else
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def edit
    if signed_in?
      @category = Category.find(params[:id])
    end
  end

  def update
    if signed_in?
      @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
        redirect_to root_path
      else
        render 'edit'
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if signed_in?
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to categories_path
    else
      redirect_to root_path
    end
  end
end
