class StudentConfirmationMailer < ActionMailer::Base
  default from: "admin@ros.org"

  def email(email, classroom)
    mail to: email,
         subject: "[Roots of Success] Confirm Your Enrollment in #{classroom.name}"
  end
end
