class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :feedback
      t.integer :order_index
      t.text :text

      t.timestamps
    end
  end
end
