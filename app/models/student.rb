# == Schema Information
#
# Table name: students
#
#  id           :integer          not null, primary key
#  classroom_id :integer
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Student < ActiveRecord::Base
  belongs_to :classroom
  has_many :answers
end