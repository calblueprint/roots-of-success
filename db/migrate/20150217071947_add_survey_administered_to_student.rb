class AddSurveyAdministeredToStudent < ActiveRecord::Migration
  def change
    add_column :students, :survey_administered, :boolean, default: false
  end
end
