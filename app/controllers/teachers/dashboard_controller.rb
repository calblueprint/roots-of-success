module Teachers
  class DashboardController < ApplicationController
    before_filter :authenticate_teacher!

    def show
    end
  end
end
