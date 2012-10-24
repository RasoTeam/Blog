class Category < ActiveRecord::Base
  attr_accessible :name
   
  has_many :posts

  validate :name, :presence => true, :length => {:maximum => 15}, :uniqueness => {:case_sensitive => false}
end
