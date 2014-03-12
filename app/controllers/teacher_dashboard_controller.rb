class TeacherDashboardController < ApplicationController
  def index
    @learning_modules = LearningModule.all
    @classrooms = Classroom.all
  end

  def new_student
    @student = Student.new
  end

  def create_student
    @student = Student.new student_params
    @student.password = SecureRandom.hex 10
    if @student.save
      flash[:success] = "Created student with password #{@student.password}!"
      UserMailer.welcome_email(@student).deliver
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
