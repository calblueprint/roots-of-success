class PreventNullProgramIdForSurveys < ActiveRecord::Migration
  def change
    change_column_null :participant_surveys, :program_id, false
    change_column_null :teacher_surveys, :program_id, false
  end
end
