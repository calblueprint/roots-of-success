module DeviseSettings
  extend ActiveSupport::Concern

  def after_sign_in_path_for(user)
    edit_teacher_path user
  end
end
