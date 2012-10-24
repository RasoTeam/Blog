class Post < ActiveRecord::Base
  attr_accessible :category_id, :content, :title

  belongs_to :category

  validates :title, :presence => true, :length => {:maximum => 15}
  validates :content, :presence => true
end
