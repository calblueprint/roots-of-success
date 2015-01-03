class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.timestamps

      t.string :name
      t.string :slug
    end
    add_index :programs, :name, unique: true
    add_index :programs, :slug, unique: true
  end
end
