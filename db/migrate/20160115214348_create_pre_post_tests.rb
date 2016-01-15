class CreatePrePostTests < ActiveRecord::Migration
  def change
    create_table :pre_post_tests do |t|
      t.timestamps null: false

      t.text :description
      t.text :link
    end
  end
end
