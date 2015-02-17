class StudentsController < ApplicationController
  before_filter :load_and_confirm_token

  def confirm
    @student.confirm!
  end

  def survey
    @survey = ParticipantSurvey.instance
  end

  def confirm_survey
    @student.survey_administered!
  end

  private

  def load_and_confirm_token
    @student = Student.find params[:id]
    @classroom = @student.classroom
    @confirmation_token = params[:confirmation_token]
    render "confirm_failed" unless @student.confirmation_token == @confirmation_token
  end
end
