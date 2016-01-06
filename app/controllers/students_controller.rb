class StudentsController < ApplicationController
  before_action :verify_token

  def confirm
    @classroom = @student.classroom
    @student.confirm!
  end

  def show_survey
    @classroom = @student.classroom
    @survey = ParticipantSurvey.find params[:survey_id]
  end

  def confirm_survey
    @classroom = @student.classroom
    @student.survey_administered!
  end

  private

  def verify_token
    id = params[:student_id] || params[:id]
    @student = Student.find id
    confirmation_token = params[:confirmation_token]
    render "confirm_failed" unless @student.confirmation_token == confirmation_token
  end
end
