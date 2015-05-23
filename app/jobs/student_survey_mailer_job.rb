class StudentSurveyMailerJob
  include SuckerPunch::Job

  def perform(students, options = {})
    ActiveRecord::Base.connection_pool.with_connection do
      classroom = options[:classroom]
      fail Exceptions::MissingClassroom unless classroom

      students.each do |student|
        StudentSurveyMailer.survey_email(student, classroom).deliver_now
      end
    end
  end
end
