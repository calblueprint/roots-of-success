class StudentsController < ApplicationController
  def confirm
    @student = Student.find params[:id]
    @classroom = @student.classroom
    if @student.confirmation_token == params[:confirmation_token]
      @student.confirm!
    else
      render "confirm_failed"
    end
  end
end
