# Classrooms Controller
class ClassroomsController < ApplicationController
  def index
    @classrooms = current_user.classrooms
  end

  def add_students_form
    @classroom = Classroom.find params[:id]
    @bad_emails = []
  end

  def add_students_to_classroom
    @classroom = Classroom.find params[:id]
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
    @classroom = Classroom.find params[:id]
    @classroom.students.delete params[:student_id]
    redirect_to classroom_path @classroom
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new classroom_params
    if @classroom.save
      flash[:success] = 'Successfully created classroom!'
      redirect_to classroom_path @classroom
    else
      render 'new'
    end
  end

  def edit
    @classroom = Classroom.find params[:id]
    @teachers = Teacher.all
  end

  def show
    @classroom = Classroom.find params[:id]
    @students = @classroom.students
    teacher = @classroom.teacher
    @module_progress = @classroom.module_progress 
    @module_names = LearningModule.names
  end

  def update
    @classroom = Classroom.find params[:id]
    teacher = Teacher.find_by_email params[:classroom][:teacher_email]
    @classroom.teacher = teacher
    if @classroom.save
      flash[:success] = 'Classroom teacher updated'
      redirect_to teacher_dashboard_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  def toggle_module
   @classroom = Classroom.find params[:id]
   @classroom.toggle_module(params[:module_name])
   @classroom.save
   redirect_to classroom_path @classroom
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :teacher_id)
  end

  def student_params
    params.require(:students).permit(:emails)
  end

  def filter_students_into_classroom(classroom, emails)
    emails.reject { |email| find_and_add_into_classroom(classroom, email) }
  end

  def find_and_add_into_classroom(classroom, email)
    student = Student.find_by_email email
    if student
      classroom.students << student
    else
      false
    end
  end
end
