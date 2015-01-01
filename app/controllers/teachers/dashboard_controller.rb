module Teachers
  class DashboardController < ApplicationController
    before_filter :authenticate_teacher!

    def show
      @teacher = current_teacher
      @classrooms = @teacher.classrooms.active
    end
  end
end
