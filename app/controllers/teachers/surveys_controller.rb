module Teachers
  class SurveysController < ApplicationController
    before_filter :set_classroom

    def index
      @participant_survey = ParticipantSurvey.instance
      @teacher_survey = TeacherSurvey.instance
    end
  end
end
