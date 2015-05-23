class StudentConfirmationsMailerJob
  include SuckerPunch::Job

  def perform(students, options = {})
    ActiveRecord::Base.connection_pool.with_connection do
      classroom = options[:classroom]
      fail Exceptions::MissingClassroom unless classroom

      students = [students] unless students.is_a? Array
      students.each do |student|
        StudentConfirmationMailer.confirmation_email(student, classroom).deliver_now
      end
    end
  end
end
