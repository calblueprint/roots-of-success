class AddModuleProgressToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :module_progress, :text
  end
end
