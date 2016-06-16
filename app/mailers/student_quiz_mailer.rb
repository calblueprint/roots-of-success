class StudentQuizMailer < ActionMailer::Base
  def quiz_email(quiz:, student:)
    @quiz = quiz
    @student = student
    @classroom = student.classroom
    mail to: @student.email,
         subject: "[Roots of Success] Take #{@quiz.name} for #{@classroom.name}"
  end
end
