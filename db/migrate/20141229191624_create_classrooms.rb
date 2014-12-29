class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.timestamps

      t.string :name
      t.belongs_to :teacher, index: true
      t.belongs_to :program, index: true
    end
  end
end
