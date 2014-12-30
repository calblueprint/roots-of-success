module Teachers
  class DashboardController < ApplicationController
    before_filter :authenticate_teacher!

    def show
      gon.push currentTeacherId: current_teacher.id,
               currentTeacher: current_teacher
    end
  end
end
