class SwitchModuleProgressColumnFromTeacherToClassroom < ActiveRecord::Migration
  def up
    remove_column :teacher_profiles, :module_progress, :text
  end
  
  def down
    add_column :classrooms, :module_progress, :text 
  end
end
