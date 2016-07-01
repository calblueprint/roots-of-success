module Teachers
  module Classrooms
    class StudentsController < BaseController
      load_and_authorize_resource # loads @student{s}

      before_action :set_classroom, only: [:new, :create, :index]

      # new and create actions are modified to create many students at a time.
      def new
      end

      def create
        email_validator = ValidateEmails.new(params[:students][:emails])
        CreateStudents.execute email_validator.valid_emails, classroom: @classroom

        if email_validator.all_valid?
          redirect_to classroom_students_path(@classroom), flash: { success: "Invited students!" }
        else
          @invalid_emails = email_validator.invalid_emails
          @value = @invalid_emails.join "\n"
          render "new"
        end
      end

      def index
        @students = @classroom.students
        gon.push addStudentsUrl: new_classroom_student_path(@classroom)
      end

      def edit
      end

      def edit_quiz_score
        @student = Student.find params[:id]
        @quiz = Quiz.find params[:quiz_id]
        @quiz_completed = @quiz.name.split.first.downcase + '_quiz_completed'
      end

      def update
        @classroom = @student.classroom

        email_unchanged = @student.email == update_params[:email]
        if email_unchanged
          redirect_to classroom_students_path(@classroom),
                      flash: { success: t(".unchanged") }
        elsif @student.update update_params
          ResendStudentConfirmation.execute @student
          @student.unconfirm!
          redirect_to classroom_students_path(@classroom),
                      flash: { success: t(".success"), email: @student.email }
        else
          @student.reload
          render "edit"
        end
      end

      def update_quiz_score
        @classroom = @student.classroom
        @quiz = Quiz.find params[:quiz_id]

        if @student.update update_params
          redirect_to classroom_quizzes_manage_students_path(@classroom, @quiz),
                      flash: { success: t(".success") }
        else
          @student.reload
          render "edit_quiz_score"
        end
      end

      def destroy
        @student.destroy
        redirect_to classroom_students_path @student.classroom
      end

      def resend_confirmation
        ResendStudentConfirmation.execute @student
        render json: {
          message: "Confirmation email resent to #{@student.email}.",
        }
      end

      def toggle_confirm_survey
        @student.toggle_survey_administered!
        redirect_to classroom_students_path @student.classroom
      end

      private

      def update_params
        params.require(:student).permit(:email,
                                        :fundamentals_quiz_completed,
                                        :water_quiz_completed,
                                        :waste_quiz_completed,
                                        :transportation_quiz_completed,
                                        :energy_quiz_completed,
                                        :building_quiz_completed,
                                        :health_quiz_completed,
                                        :community_quiz_completed,
                                        :application_quiz_completed,
                                        :financial_quiz_completed)
      end
    end
  end
end
