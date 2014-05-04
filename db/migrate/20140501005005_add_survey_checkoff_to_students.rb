class AddSurveyCheckoffToStudents < ActiveRecord::Migration
  def change
    add_column :student_profiles, :surveys_completed, :text
  end
end
