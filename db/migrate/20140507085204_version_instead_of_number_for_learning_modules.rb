class VersionInsteadOfNumberForLearningModules < ActiveRecord::Migration
  def change
    remove_column :learning_modules, :number
    add_column :learning_modules, :version, :string
  end
end
