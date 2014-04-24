# TeacherDashboardController
class TeacherDashboardController < ApplicationController
  def index
    @learning_modules = LearningModule.all.order(:number)
    @classrooms = current_user.classrooms
  end

  def new_student
    @bad_addrs = []
    @student = Student.new
  end

  def create_student
    addr_list = student_params[:emails].strip.split(/,\s*/)
    @bad_addrs = addr_list.select do |e|
      CreateUser.execute Student, password: SecureRandom.hex(10), email: e
    end
    if @bad_addrs.empty?
      flash[:success] = 'Created all students!'
      redirect_to teacher_dashboard_path
    else
      render 'new_student'
    end
  end

  private

  def student_params
    params.require(:students).permit(:emails)
  end
end
