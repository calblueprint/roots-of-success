class StudentSurveyMailerJob
  include SuckerPunch::Job

  def perform(survey:, students:)
    ActiveRecord::Base.connection_pool.with_connection do
      students.each do |student|
        StudentSurveyMailer.survey_email(
          survey: survey,
          student: student,
        ).deliver_now
      end
    end
  end
end
