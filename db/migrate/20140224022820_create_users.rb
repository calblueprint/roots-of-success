class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
	    t.string :first_name
	    t.string :last_name
	    t.string :email
	    t.string :password
      t.string :password_confirmation
      t.string :remember_me
      t.string :type

      t.timestamps
    end
  end
end
