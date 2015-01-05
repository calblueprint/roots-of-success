module Teachers
  class ClassroomsController < BaseController
    UPDATABLE_ATTRS = [:name, :description, :program_id]
    load_and_authorize_resource # loads @classroom

    def new
      @teacher = Teacher.find params[:teacher_id]
      @classroom = @teacher.classrooms.build
    end

    def show
    end

    private

    def classroom_params
      params.require(:classroom).permit(UPDATABLE_ATTRS)
    end
  end
end
