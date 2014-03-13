class ClassroomsController < ApplicationController
  def index
  end 

  def create
  end

  def new
  end

  def edit
  end

  def show
    @classroom = Classroom.find params[:id]
    @students = @classroom.students
  end

  def update
  end

  def destroy
  end
  
end
