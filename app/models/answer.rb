# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  student_id  :integer
#  answer      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  correct     :boolean          default(FALSE)
#

class Answer < ActiveRecord::Base
  belongs_to :question, counter_cache: true
  belongs_to :student, counter_cache: true

  validates :question_id, :student_id, presence: true

  scope :correct, -> { where correct: true }

  before_save :set_correct

  def set_correct
    self.correct = (answer == question.correct_answer)
    true
  end
end
