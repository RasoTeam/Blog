# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name
   
  has_many :posts

  validate :name, :presence => true, :length => {:maximum => 15}, :uniqueness => {:case_sensitive => false}
end
