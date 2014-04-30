class RemoveNameEmailFromAdminProfiles < ActiveRecord::Migration
  def change
    remove_column :admin_profiles, :name, :string
    remove_column :admin_profiles, :email, :string
    remove_column :admin_profiles, :position, :text
  end
end
