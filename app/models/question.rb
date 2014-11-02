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
<<<<<<< HEAD
#  answer_choice  :string(255)      is an Array
=======
#  answer_choice  :text             is an Array
>>>>>>> 84bc65bc604c9bce5a6bb678c69e6c2bcb736a27
#

class Question < ActiveRecord::Base
  has_many :answers
end
