class AddDescriptionToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :description, :text
  end
end
