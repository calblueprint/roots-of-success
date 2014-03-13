class AddNameToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :name, :text
  end
end
