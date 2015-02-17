class StudentSurveyMailer < ActionMailer::Base
  def survey_email(student, classroom)
    @student = student
    @classroom = classroom
    mail to: @student.email,
         subject: "[Roots of Success] Take Participant Survey for #{@classroom.name}"
  end
end
