class PagesController < ApplicationController
  before_filter :ensure_student_logged_in

  def done
    @n_correct = current_user.n_correct
    @total = current_user.total
    @percent_right = current_user.percent_right
  end
end
