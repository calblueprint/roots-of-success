class StudentConfirmationsMailerJob
  include SuckerPunch::Job

  def perform(students, options = {})
    classroom = options[:classroom]
    fail Exceptions::MissingClassroom unless classroom

    students.each do |student|
      StudentConfirmationMailer.confirmation_email(student, classroom).deliver
    end
  end
end
