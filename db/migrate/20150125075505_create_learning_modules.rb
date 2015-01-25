class CreateLearningModules < ActiveRecord::Migration
  def change
    create_table :learning_modules do |t|
      t.timestamps

      t.string :name
      t.integer :number
      t.text :presentation_embed_code
    end
  end
end
