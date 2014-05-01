class RemoveNameEmailFromStudentProfiles < ActiveRecord::Migration
  def change
    remove_column :student_profiles, :name, :string
    remove_column :student_profiles, :email, :string
    remove_column :student_profiles, :age, :integer
  end
end
