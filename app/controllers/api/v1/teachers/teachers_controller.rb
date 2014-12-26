module Api::V1
  module Teachers
    class TeachersController < BaseController
      load_and_authorize_resource # loads @teacher
      respond_to :json

      def update
        render json: { hello: :world }
      end
    end
  end
end
