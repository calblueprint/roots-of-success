module Teachers
  class LearningModulesController < BaseController
    load_and_authorize_resource # loads @learning_module{s}

    before_filter :set_classroom

    def index
      @learning_modules = @classroom.learning_modules
    end

    def show
      @presented = @learning_module.presented_to? @classroom
    end

    def toggle_present
      if @learning_module.presented_to? @classroom
        @learning_module.classrooms_presented_to.delete @classroom
      else
        @learning_module.classrooms_presented_to << @classroom
      end
      redirect_to classroom_learning_module_path(@classroom, @learning_module)
    end

    private

    def set_classroom
      @classroom = Classroom.find params[:classroom_id]
    end
  end
end
