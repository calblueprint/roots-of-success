class StudentSurveyMailerJob
  include SuckerPunch::Job

  def perform(students, options = {})
    ActiveRecord::Base.connection_pool.with_connection do
      survey = options[:survey]
      classroom = options[:classroom]
      fail Exceptions::MissingSurvey unless survey
      fail Exceptions::MissingClassroom unless classroom

      students.each do |student|
        StudentSurveyMailer.survey_email(student, survey, classroom).deliver
      end
    end
  end
end
