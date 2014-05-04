class AddTopicIdToLearningModule < ActiveRecord::Migration
  def change
    add_column :learning_modules, :learning_module_topic_id, :integer
  end
end
