# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  test_id        :integer
#  question       :string(255)
#  difficulty     :integer
#  subject        :string(255)
#  correct_answer :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  answer_choice  :string(255)      is an Array
#

class Question < ActiveRecord::Base
  has_many :answers
end
