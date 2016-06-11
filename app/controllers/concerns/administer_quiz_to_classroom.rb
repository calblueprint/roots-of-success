class AdministerQuizToClassroom
  def self.execute(classroom:, quiz:)
    students = classroom.students.confirmed

    StudentQuizMailerJob.new.async.perform(
      quiz: quiz,
      students: students,
    )
  end
end
