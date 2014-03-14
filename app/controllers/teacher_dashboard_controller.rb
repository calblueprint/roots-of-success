class TeacherDashboardController < ApplicationController
  def index
    @learning_modules = LearningModule.all
    @classrooms = Classroom.all
  end

  def new_student
    @bad_addrs = Array.new
    @student = Student.new
  end

  def create_student
    addr_list = student_params[:emails].strip.split(/,\s*/)
    @bad_addrs = addr_list.select do |e|
      (Student.create email: e,
                      password: (SecureRandom.hex 10)).new_record?
    end
    if @bad_addrs.empty?
      flash[:success] = "Created all students!"
      redirect_to teacher_dashboard_path
    else
      render 'new_student'
    end
  end

  private

  def student_params
    params.require(:student).permit(:email)
  end

end
