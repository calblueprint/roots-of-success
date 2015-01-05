module Teachers
  class ClassroomsController < BaseController
    UPDATABLE_ATTRS = [:name, :description, :program_id]
    load_and_authorize_resource # loads @classroom

    before_filter :set_teacher
    before_filter :set_program_collection, only: [:new, :edit]

    def new
      @classroom = @teacher.classrooms.build
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def classroom_params
      params.require(:classroom).permit(UPDATABLE_ATTRS)
    end

    def set_teacher
      @teacher = Teacher.find params[:teacher_id]
    end

    def set_program_collection
      @program_collection = Program.name_id_pairs
    end
  end
end
