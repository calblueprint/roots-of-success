class RenameSurveyToParticipantSurvey < ActiveRecord::Migration
  def change
    rename_table :surveys, :participant_surveys
  end
end
