ActiveAdmin.register Program do
  permit_params :name, :slug

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "Program Details" do
      f.input :name
      f.input :slug
    end
    f.actions
  end
end
