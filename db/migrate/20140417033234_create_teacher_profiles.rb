class CreateTeacherProfiles < ActiveRecord::Migration
  def change
    create_table :teacher_profiles do |t|
      t.text :institution
      t.references :teacher

      t.timestamps
    end
  end
end
