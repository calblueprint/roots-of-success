class CreateAdminProfiles < ActiveRecord::Migration
  def change
    create_table :admin_profiles do |t|
      t.text :position
      t.references :admin

      t.timestamps
    end
  end
end
