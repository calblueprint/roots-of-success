class StudentQuizMailerJob
  include SuckerPunch::Job

  def perform(quiz:, students:)
    ActiveRecord::Base.connection_pool.with_connection do
      students.each do |student|
        StudentQuizMailer.quiz_email(
          quiz: quiz,
          student: student,
        ).deliver_now
      end
    end
  end
end
