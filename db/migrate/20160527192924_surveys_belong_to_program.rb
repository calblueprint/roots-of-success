class SurveysBelongToProgram < ActiveRecord::Migration
  def change
    change_table :participant_surveys do |t|
      t.references :program, index: true
    end

    change_table :teacher_surveys do |t|
      t.references :program, index: true
    end
  end
end
