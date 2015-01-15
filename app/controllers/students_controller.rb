class StudentsController < ApplicationController
  def confirm
    @student = Student.find params[:id]
    @student.confirm!
    @classroom = @student.classroom
  end
end
