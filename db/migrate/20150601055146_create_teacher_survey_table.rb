class CreateTeacherSurveyTable < ActiveRecord::Migration
  def change
    create_table :teacher_surveys do |t|
      t.timestamps

      t.string :name
      t.text :url
      t.text :description
    end
  end
end
