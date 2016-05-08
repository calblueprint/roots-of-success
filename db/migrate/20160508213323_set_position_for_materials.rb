class SetPositionForMaterials < ActiveRecord::Migration
  def change
    SupplementalMaterial.all.each_with_index do |material, i|
      material.insert_at i + 1
    end
  end
end
