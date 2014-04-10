class RenameResponsesColumn < ActiveRecord::Migration
  def change
    rename_column :responses, :student_id_id, :student_id
    rename_column :responses, :teacher_id_id, :teacher_id
  end
end
