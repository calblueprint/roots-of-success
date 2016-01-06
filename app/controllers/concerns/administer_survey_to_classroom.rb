class AdministerSurveyToClassroom
  def self.execute(classroom:, survey:)
    students = classroom.students.confirmed.survey_not_administered

    StudentSurveyMailerJob.new.async.perform(
      survey: survey,
      students: students,
    )
  end
end
