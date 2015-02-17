class AdministerSurveyToClassroom
  def self.execute(classroom)
    students = classroom.students.confirmed.survey_not_administered

    StudentSurveyMailerJob.new.async.perform students, classroom: classroom
  end
end
