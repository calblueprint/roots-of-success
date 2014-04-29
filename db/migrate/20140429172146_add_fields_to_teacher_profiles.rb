class AddFieldsToTeacherProfiles < ActiveRecord::Migration
  def change
    add_column :teacher_profiles, :name, :string
    add_column :teacher_profiles, :email, :string
    add_column :teacher_profiles, :phone, :string
    add_column :teacher_profiles, :program, :string
    add_column :teacher_profiles, :position, :string
    add_column :teacher_profiles, :location, :string
    add_column :teacher_profiles, :curriculum_version, :string
  end
end
