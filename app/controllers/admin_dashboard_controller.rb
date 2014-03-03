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
      render 'new_teacher' #should redirect to @teacher once teacher url is created
    else
      render 'new_teacher'
    end
  end
  
  private
  
  def teacher_params
    params.require(:teacher).permit(:email)
  end
end
