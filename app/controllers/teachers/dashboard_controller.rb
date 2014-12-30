module Teachers
  class DashboardController < ApplicationController
    before_filter :authenticate_teacher!

    def show
      gon.push currentTeacherId: current_teacher.id
    end
  end
end
