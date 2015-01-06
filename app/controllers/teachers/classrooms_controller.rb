module Teachers
  class ClassroomsController < BaseController
    UPDATABLE_ATTRS = [:name, :description, :program_id]
    load_and_authorize_resource # loads @classroom

    before_filter :set_teacher, only: [:index, :new, :create]
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
