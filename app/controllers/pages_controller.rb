class PagesController < ApplicationController
  def done
    @n_correct = current_user.n_correct
    @total = current_user.total
    @percent_right = current_user.percent_right
  end
end
