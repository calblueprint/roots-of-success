class CreateSupplementalMaterials < ActiveRecord::Migration
  def change
    create_table :supplemental_materials do |t|
      t.timestamps null: false

      t.text :content
      t.references :classroom, index: true, null: false
    end
  end
end
