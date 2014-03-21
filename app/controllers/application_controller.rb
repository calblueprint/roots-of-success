class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(user)
    if user.filled_in?
      return edit_profile_path user.profile
    end
    return admin_dashboard_path if user.type == 'Admin'
    return teacher_dashboard_path if user.type == 'Teacher'
  end
end
