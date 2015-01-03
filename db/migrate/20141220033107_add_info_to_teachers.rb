class AddInfoToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :phone, :string
    add_column :teachers, :position, :string
    add_column :teachers, :location, :string
    add_column :teachers, :curriculum_version_id, :integer
    add_index :teachers, :curriculum_version_id
  end
end
