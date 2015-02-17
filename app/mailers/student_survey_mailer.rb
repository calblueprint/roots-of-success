class StudentSurveyMailer < ActionMailer::Base
  def survey_email(student, survey, classroom)
    @student = student
    @survey = survey
    @classroom = classroom
    mail to: @student.email,
         subject: "[Roots of Success] Take Participant Survey for #{@classroom.name}"
  end
end
