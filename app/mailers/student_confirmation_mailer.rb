class StudentConfirmationMailer < ActionMailer::Base
  default from: "admin@ros.org"

  def confirmation_email(student, classroom)
    @student = student
    @classroom = classroom
    @teacher = classroom.teacher
    mail to: @student.email,
         subject: "[Roots of Success] Confirm Your Enrollment in #{@teacher.name}'s #{@classroom.name}"
  end
end
