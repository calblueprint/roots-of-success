module Teachers
  class BaseController < ApplicationController
    before_filter :authorize_access!

    private

    def set_header
      @header = "teacher_header"
    end

    def authorize_access!
      authorize! :manage, :teacher_dashboard
    end
  end
end
