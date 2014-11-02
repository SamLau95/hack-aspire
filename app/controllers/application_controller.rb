class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # TODO: use actual routes
  def after_sign_in_path_for(user)
    if user.student?
      test_path
    elsif user.teacher?
      analytics_teachers_path
    else
      fail 'Bad user!'
    end
  end
end
