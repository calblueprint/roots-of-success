# Classrooms Controller
class ClassroomsController < ApplicationController
  def index
    @classrooms = current_user.classrooms
  end

  def create
    @classroom = Classroom.new classroom_params
    if @classroom.save
      flash[:success] = 'Successfully created classroom!'
      redirect_to teacher_dashboard_path
    else
      render 'new'
    end
  end

  def new
    @classroom = Classroom.new
  end

  def edit
    @classroom = Classroom.find params[:id]
    @teachers = Teacher.all
  end

  def show
    @classroom = Classroom.find params[:id]
    @students = @classroom.students
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

  private

  def classroom_params
    params.require(:classroom).permit(:name, :teacher_id)
  end
end
