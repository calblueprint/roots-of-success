class ClassroomsController < ApplicationController
  def index
  end 

  def create
  end

  def new
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
    @id = params[:classroom][:teacher_id]
    @classroom.teacher_id = @id
    @classroom.save
    redirect_to teacher_dashboard_path
  end

  def destroy
  end
  
end
