class FixLearningModulesNumberColumn < ActiveRecord::Migration
  def change
    rename_column :learning_modules, :module_number, :number
  end
end
