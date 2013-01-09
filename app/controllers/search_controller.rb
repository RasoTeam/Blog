class SearchController < ApplicationController
  def search
    s = params[:query]
    @posts = Post.where('content LIKE ? OR title LIKE ?', '%' + s + '%','%' + s + '%').paginate(:page => params[:page], :per_page => 4)
    #find(:all, :conditions => ['content LIKE ?', '%' + s + '%']).paginate(:page => params[:page], :per_page => 4)
  end
end
