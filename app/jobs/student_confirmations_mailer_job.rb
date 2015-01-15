class StudentConfirmationsMailerJob
  include SuckerPunch::Job

  def perform(emails, options = {})
    classroom = options[:classroom]
    fail Exceptions::MissingClassroom unless classroom

    emails.each { |email| StudentConfirmationMailer.email(email, classroom).deliver }
  end
end
