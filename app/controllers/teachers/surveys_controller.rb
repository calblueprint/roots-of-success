module Teachers
  class SurveysController < ApplicationController
    def index
      @participant_survey = ParticipantSurvey.instance
      @teacher_survey = TeacherSurvey.instance
    end
  end
end
