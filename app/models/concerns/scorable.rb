module Scorable
  extend ActiveSupport::Concern

  def score
    ans = answers
    ans.correct.length.to_f / ans.length
  end
end
