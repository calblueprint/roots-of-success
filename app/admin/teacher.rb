ActiveAdmin.register Teacher do
  permit_params :first_name, :last_name, :email, :password, :phone, :position, :location

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone
    column :position
    column :location
    actions
  end

  filter :name
  filter :email
  filter :position
  filter :location

  form do |f|
    f.inputs "Teacher Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
    end
    f.actions
  end
end
