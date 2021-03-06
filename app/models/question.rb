# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  test_id        :integer
#  question       :text
#  difficulty     :integer
#  subject        :text
#  correct_answer :text
#  created_at     :datetime
#  updated_at     :datetime
#  answer_choice  :text             is an Array
#  number         :integer
#  answers_count  :integer          default(0)
#

class Question < ActiveRecord::Base
  default_scope -> { order :number }

  has_many :answers

  validates :test_id, presence: true

  include Scorable
end
