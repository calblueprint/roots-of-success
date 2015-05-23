class RenameCardImageToCardImageId < ActiveRecord::Migration
  def change
    rename_column :classrooms, :card_image, :card_image_id
  end
end
