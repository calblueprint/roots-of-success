module DeviseSettings
  extend ActiveSupport::Concern

  def after_sign_in_path_for(user)
    return teacher_dashboard_path if user.is_a? Teacher
    fail "Bad user!"
  end
end
