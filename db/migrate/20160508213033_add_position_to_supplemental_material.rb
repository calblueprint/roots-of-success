class AddPositionToSupplementalMaterial < ActiveRecord::Migration
  def change
    add_column :supplemental_materials, :position, :integer
  end
end
