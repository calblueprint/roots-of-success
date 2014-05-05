class AddNumberColumnToModuleTopics < ActiveRecord::Migration
  def change
    add_column :learning_module_topics, :number, :integer
  end
end
