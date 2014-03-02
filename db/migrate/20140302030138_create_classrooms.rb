class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.belongs_to :teacher
      t.timestamps
    end
    add_index :classrooms, :teacher_id
  end
end
