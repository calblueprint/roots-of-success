class AddActiveToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :active, :boolean, default: true
  end
end
