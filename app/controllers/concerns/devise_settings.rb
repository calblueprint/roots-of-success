module DeviseSettings
  extend ActiveSupport::Concern

  def current_user
    current_teacher
  end

  def after_sign_in_path_for(user)
    return teacher_dashboard_path if user.is_a? Teacher
    return admin_dashboard_path if user.is_a? AdminUser
    fail "Bad user!"
  end
end
