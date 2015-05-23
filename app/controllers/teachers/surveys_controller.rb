module Teachers
  class SurveysController < BaseController
    load_and_authorize_resource
    before_action :set_classroom
    before_action :set_participant_survey

    def index
      @teacher_surveys = TeacherSurvey.all
    end

    def administer
      AdministerSurveyToClassroom.execute @classroom
      redirect_to classroom_surveys_path(@classroom), flash: { success: "Survey emailed!" }
    end

    private

    def set_participant_survey
      @participant_survey = ParticipantSurvey.instance
    end
  end
end
