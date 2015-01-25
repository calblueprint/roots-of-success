class ResendStudentConfirmation
  def self.execute(student)
    StudentConfirmationsMailerJob.new.async.perform student, classroom: student.classroom
  end
end
