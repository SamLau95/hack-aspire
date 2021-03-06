# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  type                   :string(255)
#  classroom_id           :integer
#  answers_count          :integer          default(0)
#

class Student < User
  belongs_to :classroom
  has_many :answers

  validates :classroom_id, presence: true

  scope :taken_test, -> { where 'answers_count > 0' }

  after_initialize :set_classroom

  include Scorable

  def student?
    true
  end

  def taken_test?
    answers.any?
  end

  def set_classroom
    self.classroom = Classroom.first
  end
end
