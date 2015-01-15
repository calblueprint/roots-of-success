class AddClassroomIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :classroom_id, :integer
    add_index :students, :classroom_id
  end
end
