module Teachers
  class LearningModulesController < BaseController
    load_and_authorize_resource # loads @learning_module{s}

    before_filter :set_classroom

    def index
      @learning_modules = @classroom.learning_modules
    end

    def show
    end

    def present
    end

    private

    def set_classroom
      @classroom = Classroom.find params[:classroom_id]
    end
  end
end
