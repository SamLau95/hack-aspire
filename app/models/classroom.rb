# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Classroom < ActiveRecord::Base
  has_many :students
  has_many :tests
end
