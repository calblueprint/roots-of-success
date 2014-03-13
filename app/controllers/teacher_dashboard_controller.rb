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
    addrs = student_params[:email]
    @addr_list = addrs.gsub(/\r?\n|\s/,'').split(",")
    @bad_addrs = @addr_list.select{ |e| (@t = Student.create(email: e, password: (SecureRandom.hex 10))).new_record? || !UserMailer.welcome_email(@t).deliver }
    if @bad_addrs.empty?
      flash[:success] = "Created all students!"
      redirect_to teacher_dashboard_index_path
    else
      render 'new_student'
    end
  end

  private

  def student_params
    params.require(:student).permit(:email)
  end

end
