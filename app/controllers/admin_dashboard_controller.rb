class AdminDashboardController < ApplicationController
  def index
  end
  def new
    @teacher = Teacher.new
  end
  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.password = SecureRandom.hex(10)
    if @teacher.save
      flash[:notice] = "Successfully created account"
      render 'new'
    else
      flash[:notice] = "Email is invalid"
      render 'new'
    end
  end
  
  private
  
  def teacher_params
    params.require(:teacher).permit(:email)
  end
end
