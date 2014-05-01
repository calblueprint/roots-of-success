class AddFieldsToStudentProfiles < ActiveRecord::Migration
  def change
    add_column :student_profiles, :name, :string
    add_column :student_profiles, :email, :string
    add_column :student_profiles, :phone, :string
  end
end
