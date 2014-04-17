class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.integer :age
      t.references :student

      t.timestamps
    end
  end
end
