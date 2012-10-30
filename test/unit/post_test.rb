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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
