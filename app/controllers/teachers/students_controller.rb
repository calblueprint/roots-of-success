module Teachers
  class StudentsController < BaseController
    load_and_authorize_resource # loads @student{s}

    before_filter :set_classroom, only: [:index]

    # new and create actions are modified to create many students at a time.
    def new
    end

    def create
    end

    private

    def set_classroom
      @classroom = Classroom.find params[:classroom_id]
    end
  end
end
