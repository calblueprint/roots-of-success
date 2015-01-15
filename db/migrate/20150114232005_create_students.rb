class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.timestamps

      t.string :email
      t.string :confirmation_token
      t.boolean :confirmed, default: false
    end
  end
end
