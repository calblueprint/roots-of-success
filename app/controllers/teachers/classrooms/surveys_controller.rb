module Teachers
  module Classrooms
    class SurveysController < BaseController
      include ActionView::Helpers::TextHelper

      before_action :authorize_access!
      before_action :set_classroom

      def index
        @pre_post_tests = PrePostTest.all
        @participant_survey = @classroom.participant_survey
        @teacher_survey = @classroom.teacher_survey
      end

      def administer
        survey = ParticipantSurvey.find params[:survey_id]

        AdministerSurveyToClassroom.execute(
          classroom: @classroom,
          survey: survey,
        )

        redirect_to classroom_surveys_path(@classroom),
                    flash: { success: "Survey emailed to students!" }
      end
    end
  end
end
