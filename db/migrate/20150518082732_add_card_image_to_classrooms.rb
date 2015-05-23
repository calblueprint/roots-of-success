class AddCardImageToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :card_image, :string
  end
end
