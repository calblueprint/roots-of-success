class QuizDecorator < Draper::Decorator
  delegate_all

  def module_name
    object.name.sub(' Quiz', '')
  end
end
