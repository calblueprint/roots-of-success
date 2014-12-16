class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.timestamps

      t.string :first_name
      t.string :last_name
    end
  end
end
