class RemoveCurriculumVersionIdFromTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :curriculum_version_id, :integer
  end
end
