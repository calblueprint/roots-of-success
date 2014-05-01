class RemoveNameEmailFromTeacherProfiles < ActiveRecord::Migration
  def change
    remove_column :teacher_profiles, :name, :string
    remove_column :teacher_profiles, :email, :string
    remove_column :teacher_profiles, :institution, :text
  end
end
