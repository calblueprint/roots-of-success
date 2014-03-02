class AddClassroomIdToStudents < ActiveRecord::Migration
  def change
    add_column :users, :classroom_id, :integer
    add_index :users, :classroom_id
  end
end
