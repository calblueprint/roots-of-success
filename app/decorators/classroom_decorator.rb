class ClassroomDecorator < Draper::Decorator
  delegate_all

  def presented_modules_count
    object.presented_learning_modules.count
  end

  def presented_modules_label
    "Module".pluralize(classroom.presented_learning_modules.count) + " presented"
  end

  def survey_stats
    "#{classroom.students.survey_administered.count} of #{classroom.students.count}"
  end

  def survey_stats_label
    "Surveys taken"
  end
end
