class AddNameToSupplementalMaterials < ActiveRecord::Migration
  def change
    add_column :supplemental_materials, :name, :string
  end
end
