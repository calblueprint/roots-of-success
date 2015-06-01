class RemoveTypeFromParticipantSurvey < ActiveRecord::Migration
  def change
    remove_column :participant_surveys, :type, :string
  end
end
