class AddModuleNumber < ActiveRecord::Migration
  def change
  	add_column :learning_modules, :module_number, :integer
  end
end
