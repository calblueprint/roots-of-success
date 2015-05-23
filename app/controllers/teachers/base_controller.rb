module Teachers
  class BaseController < ApplicationController
    before_action :authorize_access!
    before_action :set_active_tab

    private

    def set_header
      @header = "teacher_header"
    end

    def authorize_access!
      authorize! :manage, :teacher_dashboard
    end

    def set_active_tab
      @active_tab = controller_name
    end

    def set_classroom
      @classroom = Classroom.find params[:classroom_id]
    end
  end
end
