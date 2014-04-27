module SessionHelper
  def teacher?
    current_user && current_user.type == 'Teacher'
  end

  def admin?
    current_user && current_user.type == 'Admin'
  end

  def student?
    current_user && current_user.type == 'Student'
  end
end
