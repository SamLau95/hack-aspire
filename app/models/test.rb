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

class Test < ActiveRecord::Base
end
