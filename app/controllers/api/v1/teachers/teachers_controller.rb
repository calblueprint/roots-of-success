module Api::V1
  module Teachers
    class TeachersController < BaseController
      load_and_authorize_resource except: :current # loads @teacher
      respond_to :json

      def current
        respond_with current_teacher
      end

      def edit
        respond_with @teacher
      end

      def update
        if @teacher.update teacher_params
          render json: @teacher, status: :ok
        else
          render json: @teacher.errors, status: :unprocessable_entity
        end
      end

      private

      def teacher_params
        params.require(:teacher).permit(TeacherSerializer::UPDATABLE_ATTRS)
      end
    end
  end
end
