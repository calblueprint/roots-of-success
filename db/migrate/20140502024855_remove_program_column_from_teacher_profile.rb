class RemoveProgramColumnFromTeacherProfile < ActiveRecord::Migration
  def change
    remove_column :teacher_profiles, :program, :string
  end
end
