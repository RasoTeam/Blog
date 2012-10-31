# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user        :reference
#

class Post < ActiveRecord::Base
  attr_accessible :user_id, :category_id, :content, :title

  belongs_to :category
  belongs_to :user

  validates :title, :presence => true, :length => {:maximum => 15}
  validates :content, :presence => true
end
