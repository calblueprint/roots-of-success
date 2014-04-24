class ApplicationController < ActionController::Base
  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    return edit_profile_path user unless user.profile_filled_in?
    return admin_dashboard_path if user.type == 'Admin'
    return teacher_dashboard_path if user.type == 'Teacher'
  end
end
