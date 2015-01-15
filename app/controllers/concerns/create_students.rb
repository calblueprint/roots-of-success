class CreateStudents
  def self.execute(emails, options = {})
    classroom = options[:classroom]
    fail Exceptions::MissingClassroom unless classroom

    emails.each { |email| classroom.students.create email: email }
    StudentConfirmationsMailerJob.new.async.perform emails, classroom: classroom
  end
end
