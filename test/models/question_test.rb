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
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
