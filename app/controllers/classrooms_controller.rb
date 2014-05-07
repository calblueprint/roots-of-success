# Classrooms Controller
class ClassroomsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def add_students_form
    @bad_emails = []
  end

  def add_students_to_classroom
    emails = student_params[:emails].strip.split(/,\s*/)
    @bad_emails = filter_students_into_classroom @classroom, emails
    if @bad_emails.empty?
      flash[:success] = 'Added all students!'
      redirect_to classroom_path @classroom
    else
      render 'add_students_form'
    end
  end

  def remove_student_from_classroom
    @classroom.students.delete params[:student_id]
    redirect_to classroom_path @classroom
  end

  def new
  end

  def create
    if @classroom.save
      flash[:success] = 'Successfully created classroom!'
      redirect_to classroom_path @classroom
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @students = @classroom.students
    @teacher = @classroom.teacher
    @module_progress = @classroom.module_progress
    @module_names = LearningModule.names
    @surveys = @classroom.survey_titles
  end

  def update
    @classroom.program = params[:classroom][:program]
    if @classroom.save
      @classroom.set_student_surveys
      flash[:success] = 'Classroom program type updated!'
      redirect_to @classroom
    else
      render 'show'
    end
  end

  def update_teacher
    teacher = Teacher.find_by_email params[:classroom][:teacher_email]
    # TODO: Use a validation
    @classroom.teacher = teacher if teacher
    if @classroom.save
      flash[:success] = 'Classroom teacher updated!'
      redirect_to teacher_dashboard_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  def toggle_module
    @classroom.toggle_module!(params[:module_name])
    redirect_to classroom_path @classroom
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :teacher_id, :program)
  end

  def student_params
    params.require(:students).permit(:emails)
  end

  def filter_students_into_classroom(classroom, emails)
    emails.reject { |email| find_set_survey_and_add classroom, email }
  end

  def find_set_survey_and_add(classroom, email)
    student = Student.find_by_email email
    if student
      student.set_survey_progress!
      classroom.students << student
    else
      false
    end
  end
end
