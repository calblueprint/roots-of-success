class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.timestamps

      t.string :name
      t.text :form_embed_code
    end

    create_table :classroom_surveys do |t|
      t.timestamps
      t.belongs_to :classroom, index: true
      t.belongs_to :survey, index: true
    end
  end
end
