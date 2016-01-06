module Teachers
  class SurveysController < BaseController
    include ActionView::Helpers::TextHelper

    before_action :authorize_access!
    before_action :set_classroom

    def index
      @participant_surveys = ParticipantSurvey.all
      @teacher_surveys = TeacherSurvey.all
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
