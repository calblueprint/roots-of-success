class ModulesProgressInTeacherProfile < ActiveRecord::Migration
  def change
    add_column :teacher_profiles, :modules, :boolean
  end
end
