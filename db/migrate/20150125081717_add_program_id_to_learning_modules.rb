class AddProgramIdToLearningModules < ActiveRecord::Migration
  def change
    add_column :learning_modules, :program_id, :integer
    add_index :learning_modules, :program_id
  end
end
