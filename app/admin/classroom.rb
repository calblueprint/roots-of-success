ActiveAdmin.register Classroom do
  permit_params :name, :teacher_id, :program_id, :active, :description

  index do
    selectable_column
    id_column
    column :name
    column :teacher
    column :program
    column :active
    column :description
    actions
  end

  filter :name
  filter :teacher
  filter :program
  filter :active
  filter :description

  form do |f|
    f.inputs "Classroom Details" do
      f.input :name
      f.input :teacher
      f.input :program
      f.input :active
      f.input :description
    end
    f.actions
  end
end
