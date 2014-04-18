class AddLearningModuleUploaderToLearningModule < ActiveRecord::Migration
  def change
    add_column :learning_modules, :learning_module_file, :string
  end
end
