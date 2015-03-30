ActiveAdmin.register LearningModule do
  permit_params :name, :number, :presentation_embed_code, :program_id

  index do
    selectable_column
    id_column
    column :name
    column :program
    column :number
    actions
  end

  filter :name
  filter :program
  filter :number

  form do |f|
    f.inputs "Learning Module Details" do
      f.input :name
      f.input :program
      f.input :number
      f.input :presentation_embed_code
    end
    f.actions
  end
end
