module Api::V1
  module Teachers
    class BaseController < ApplicationController
      before_filter :authorize_access!

      private

      def authorize_access!
        authorize! :manage, :teacher_dashboard
      end
    end
  end
end
