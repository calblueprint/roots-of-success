class MoveProgramFromTeacherProfileToClassroom < ActiveRecord::Migration
  def up 
    add_column :classrooms, :program, :string
  end
  
  def down
    remove_column :teacher_profiles, :program, :string
  end
end
