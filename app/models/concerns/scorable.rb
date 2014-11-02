module Scorable
  extend ActiveSupport::Concern

  def percent_right
    n_correct.to_f / total
  end

  def correct
    answers.correct
  end

  def n_correct
    correct.length
  end

  def total
    answers.length
  end
end
