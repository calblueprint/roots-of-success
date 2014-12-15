module DeviseSettings
  extend ActiveSupport::Concern

  def after_sign_in_path_for(user)
    return edit_profile_path user unless user.profile_filled_in?
    return admin_dashboard_path if user.type == 'Admin'
    return teacher_dashboard_path if user.type == 'Teacher'
    return profile_path user if user.type == 'Student'
  end
end
