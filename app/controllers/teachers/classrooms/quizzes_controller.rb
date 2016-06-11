module Teachers
  module Classrooms
    class QuizzesController < BaseController
      before_action :set_classroom

      def index
        @quizzes = @classroom.program.quizzes
      end

      def administer
        quiz = Quiz.find params[:quiz_id]

        AdministerQuizToClassroom.execute(
          classroom: @classroom,
          quiz: quiz,
        )

        redirect_to classroom_quizzes_path(@classroom),
                    flash: { success: "Quiz emailed to students" }
      end
    end
  end
end
