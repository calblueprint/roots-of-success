module Teachers
  class QuizzesController < BaseController
    def index
      @classroom = Classroom.find params[:classroom_id]
      @quizzes = @classroom.program.quizzes
    end

    # TODO: administer quizzes
  end
end
