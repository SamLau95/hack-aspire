# == Schema Information
#
# Table name: tests
#
#  id           :integer          not null, primary key
#  classroom_id :integer
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
