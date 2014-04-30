class ChangeModulesToModulesProgress < ActiveRecord::Migration
  def change
    rename_column :teacher_profiles, :modules, :module_progress
  end
end
