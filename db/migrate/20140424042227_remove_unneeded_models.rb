class RemoveUnneededModels < ActiveRecord::Migration
  def change
    drop_table :feedbacks
    drop_table :questions
    drop_table :responses
  end
end
