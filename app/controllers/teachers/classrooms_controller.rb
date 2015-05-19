module Teachers
  class ClassroomsController < BaseController
    UPDATABLE_ATTRS = [:name, :description, :program_id, :card_image]
    load_and_authorize_resource # loads @classroom

    before_filter :set_active_tab, only: [:edit, :update]
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
      # Default view is students index.
      redirect_to classroom_students_path @classroom
    end

    def index
      # TODO: Classroom index page shows active and inactive classrooms
      # https://github.com/calblueprint/roots-of-success/issues/145
    end

    def edit
    end

    def update
      if @classroom.update classroom_params
        redirect_to edit_classroom_path(@classroom), flash: { success: t(".success") }
      else
        render "edit"
      end
    end

    def transfer
      other_teacher = Teacher.find_by email: params[:teacher_transfer][:email]
      if other_teacher
        @classroom.transfer_to! other_teacher
        redirect_to teacher_dashboard_path, flash: { success: "#{@classroom} transfered!" }
      else
        redirect_to edit_classroom_path(@classroom), flash: { error: "No teacher found with that email." }
      end
    end

    def destroy
      @classroom.destroy
      redirect_to teacher_dashboard_path
    end

    private

    def classroom_params
      params.require(:classroom).permit(UPDATABLE_ATTRS)
    end

    def set_active_tab
      @active_tab = "classroom_edit"
    end

    def set_teacher
      @teacher = Teacher.find params[:teacher_id]
    end

    def set_program_collection
      @program_collection = Program.name_id_pairs
    end
  end
end
