class RemoveAuthTokenFromTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :authentication_token, :string
  end
end
