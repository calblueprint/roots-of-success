class StudentsController < ApplicationController
  def index
  end 

  def create
  end

  def new
  end

  def edit
  end

  def show
    @student = Student.find params[:id]
  end

  def update
  end

  def destroy
  end
  
end
