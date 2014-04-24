# Actions for the admin dashboard
class AdminDashboardController < ApplicationController
  def index
    @learning_modules = LearningModule.all.order(:number)
    @classrooms = Classroom.all
  end

  def show_teachers
    t = UsersDatatable.new(Teacher, view_context)
    respond_to do |format|
      format.html
      format.json { render json: t }
    end
  end

  def show_students
    t = UsersDatatable.new(Student, view_context)
    respond_to do |format|
      format.html
      format.json { render json: t }
    end
  end

  def surveys
    @all_teachers_surveys = AllTeachersSurvey.first
    @correctional_teachers_survey = CorrectionalFacilityTeachersSurvey.first
    @highschool_teachers_survey = HighschoolTeachersSurvey.first
    @highschool_students_survey = HighschoolStudentsSurvey.first
  end

  def new_teacher
    @bad_addrs = []
    @teacher = Teacher.new
  end

  def create_teacher
    addr_list = teacher_params[:emails].strip.split(/,\s*/)
    @bad_addrs = addr_list.select do |e|
      CreateUser.execute(Teacher, password: (SecureRandom.hex 10), email: e)
    end
    if @bad_addrs.empty?
      flash[:success] = 'Created all teachers!'
      redirect_to admin_dashboard_path
    else
      render 'new_teacher'
    end
  end

  private

  def teacher_params
    params.require(:teachers).permit(:emails)
  end
end
