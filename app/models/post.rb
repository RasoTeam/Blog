class Post < ActiveRecord::Base
  belongs_to :post_category
  attr_accessible :content, :title
end
