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

  def fail_authorization_if(condition)
    if condition
      flash[:error] = 'You are not allowed to view that page!'
      redirect_to root_path
    end
  end

  def ensure_student_logged_in
    fail_authorization_if(!current_user || !current_user.student?)
  end

  def ensure_teacher_logged_in
    fail_authorization_if(!current_user || !current_user.teacher?)
  end
end
