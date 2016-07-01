class QuizDecorator < Draper::Decorator
  delegate_all

  def student_column_name
    object.name.split.first.downcase + '_quiz_completed'
  end

  def module_name
    object.name.sub(' Quiz', '')
  end
end
