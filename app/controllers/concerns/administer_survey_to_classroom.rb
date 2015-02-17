class AdministerSurveyToClassroom
  def self.execute(survey, options = {})
    fail Exceptions::MissingSurvey unless survey
    classroom = options[:classroom]
    fail Exceptions::MissingClassroom unless classroom

    students = classroom.students.confirmed.survey_not_administered

    StudentSurveyMailerJob.new.async.perform students, survey: survey, classroom: classroom
  end
end
