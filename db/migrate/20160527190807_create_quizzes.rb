class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.timestamps

      t.string :name
      t.text :form_embed_code
      t.text :description
    end
  end
end
