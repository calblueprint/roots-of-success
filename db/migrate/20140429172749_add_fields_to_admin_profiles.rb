class AddFieldsToAdminProfiles < ActiveRecord::Migration
  def change
    add_column :admin_profiles, :name, :string
    add_column :admin_profiles, :email, :string
  end
end
