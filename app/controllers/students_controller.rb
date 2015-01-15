class StudentsController < ApplicationController
  def confirm
    @student = Student.find params[:id]
    render "confirm_failed" unless @student.confirmation_token == params[:confirmation_token]
    @student.confirm!
    @classroom = @student.classroom
  end
end
