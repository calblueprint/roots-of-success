class StudentConfirmationsMailerJob
  include SuckerPunch::Job

  def perform(students, options = {})
    ActiveRecord::Base.connection_pool.with_connection do
      classroom = options[:classroom]
      fail Exceptions::MissingClassroom unless classroom

      students.each do |student|
        StudentConfirmationMailer.confirmation_email(student, classroom).deliver
      end
    end
  end
end
