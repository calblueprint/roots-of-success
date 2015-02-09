class CreateClassroomModulePresents < ActiveRecord::Migration
  def change
    create_table :classroom_module_presents do |t|
      t.timestamps
      t.belongs_to :classroom, index: true
      t.belongs_to :learning_module, index: true
    end
  end
end
