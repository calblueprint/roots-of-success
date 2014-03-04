class AdminDashboardController < ApplicationController
  def index
  end
  def new_teacher
    @teacher = Teacher.new
  end
  def create_teacher
    @teacher = Teacher.new teacher_params
    @teacher.password = SecureRandom.hex 10
    if @teacher.save
      redirect_to admin_dashboard_index_path
    else
      render 'new_teacher'
    end
  end
  
  private
  
  def teacher_params
    params.require(:teacher).permit(:email)
  end
end
