class SearchController < ApplicationController
  def search
    s = params[:query]
    @posts = Post.find(:all, :conditions => ['content LIKE ?', '%' + s + '%'])
  end
end
