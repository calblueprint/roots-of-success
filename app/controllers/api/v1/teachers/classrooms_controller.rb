module Api::V1
  module Teachers
    class ClassroomsController < BaseController
      load_and_authorize_resource # loads @classroom
      respond_to :json

      def index
        respond_with @classrooms.active
      end

      def edit
        respond_with @classroom
      end

      def update
        if @classroom.update teacher_params
          render json: @classroom, status: :ok
        else
          render json: @classroom.errors, status: :unprocessable_entity
        end
      end

      private

      def classroom_params
        params.require(:classroom).permit(ClassroomSerializer::UPDATABLE_ATTRS)
      end
    end
  end
end
