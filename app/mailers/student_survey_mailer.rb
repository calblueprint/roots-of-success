class StudentSurveyMailer < ActionMailer::Base
  def survey_email(survey:, student:)
    @survey = survey
    @student = student
    @classroom = student.classroom
    mail to: @student.email,
         subject: "[Roots of Success] Take Participant Survey for #{@classroom.name}"
  end
end
