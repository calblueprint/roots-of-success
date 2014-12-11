class AddModuleNameAndDescription < ActiveRecord::Migration
  def change
    add_column :learning_modules, :name, :string
    add_column :learning_modules, :description, :string
  end
end
