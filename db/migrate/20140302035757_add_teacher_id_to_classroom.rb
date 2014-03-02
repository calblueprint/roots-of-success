class AddTeacherIdToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :teacher_id, :integer
    add_index :classrooms, :teacher_id
  end
end
