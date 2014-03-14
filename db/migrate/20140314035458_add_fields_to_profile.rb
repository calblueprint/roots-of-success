class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :description, :text
    add_column :profiles, :phone_number, :text
    add_column :profiles, :address, :text
    add_reference :profiles, :user, index: true
  end
end
