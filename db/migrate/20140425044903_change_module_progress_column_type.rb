class ChangeModuleProgressColumnType < ActiveRecord::Migration
  def self.up
    change_column :teacher_profiles, :module_progress, :text
  end

  def self.down
    change_column :teacher_profiles, :module_progress, :boolean
  end
end
