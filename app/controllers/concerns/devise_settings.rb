module DeviseSettings
  extend ActiveSupport::Concern

  def after_sign_in_path_for(user)
    1/0
  end
end
