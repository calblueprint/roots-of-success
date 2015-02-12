class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.timestamps

      t.string :name
      t.text :form_embed_code
    end
  end
end
