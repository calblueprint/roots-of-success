class CreateStudents
  def self.execute(emails, options = {})
    classroom = options[:classroom]
    fail Exceptions::MissingClassroom unless classroom

    students = emails.map { |email| classroom.students.create email: email }
    StudentConfirmationsMailerJob.new.async.perform students, classroom: classroom
  end
end
