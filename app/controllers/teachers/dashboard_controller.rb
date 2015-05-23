module Teachers
  class DashboardController < BaseController
    before_action :authenticate_teacher!

    def show
      @teacher = current_teacher
      @classrooms = @teacher.classrooms.active
    end
  end
end
