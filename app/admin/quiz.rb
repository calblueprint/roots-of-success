ActiveAdmin.register Quiz do
  permit_params :name, :form_embed_code, :program_id

  index do
    selectable_column
    id_column
    column :name
    column :program
    actions
  end

  filter :name
  filter :program

  form do |f|
    f.inputs "Quiz Details" do
      f.input :name
      f.input :program
      f.input :form_embed_code
    end
    f.actions
  end
end
