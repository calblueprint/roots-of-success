module Teachers
  class ClassroomsController < BaseController
    UPDATABLE_ATTRS = [:name, :description, :program_id]
    load_and_authorize_resource # loads @classroom

    before_filter :set_teacher, only: [:new, :create, :index]
    before_filter :set_program_collection, only: [:new, :create, :edit, :update]

    def new
      @classroom = @teacher.classrooms.build
    end

    def create
      @classroom = @teacher.classrooms.build classroom_params
      if @classroom.save
        redirect_to @classroom, flash: { success: t(".success") }
      else
        render "new"
      end
    end

    def show
    end

    def index
      # TODO: Classroom index page shows active and inactive classrooms
      # https://github.com/calblueprint/roots-of-success/issues/145
    end

    def edit
      # TODO: Replace with classroom settings tab on classroom show
      # https://github.com/calblueprint/roots-of-success/issues/147
    end

    def update
      # TODO: Replace with classroom settings tab on classroom show
      # https://github.com/calblueprint/roots-of-success/issues/147
      if @classroom.update classroom_params
        redirect_to @classroom, flash: { success: t(".success") }
      else
        render "edit"
      end
    end

    def destroy
      # TODO: Replace with classroom settings tab on classroom show
      # https://github.com/calblueprint/roots-of-success/issues/147
      @classroom.destroy
      redirect_to teacher_dashboard_path
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
