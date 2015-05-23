module Teachers
  class DashboardController < BaseController
    before_action :authenticate_teacher!

    def show
      @teacher = current_teacher
      @classrooms = ClassroomDecorator.decorate_collection(
        @teacher.classrooms.active.includes(:students).includes(:presented_learning_modules)
      )
    end
  end
end
