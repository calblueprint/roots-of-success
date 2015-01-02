module Teachers
  class TeachersController < BaseController
    UPDATABLE_ATTRS = [:first_name, :last_name, :email, :phone, :position, :location]
    load_and_authorize_resource # loads @teacher

    def edit
    end

    def update
      if @teacher.update teacher_params
        redirect_to teacher_dashboard_path
      else
        render "edit"
      end
    end

    private

    def teacher_params
      params.require(:teacher).permit(UPDATABLE_ATTRS)
    end
  end
end
