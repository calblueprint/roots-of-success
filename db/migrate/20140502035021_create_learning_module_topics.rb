class CreateLearningModuleTopics < ActiveRecord::Migration
  def change
    create_table :learning_module_topics do |t|
      t.string :topic

      t.timestamps
    end
  end
end
