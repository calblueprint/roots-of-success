ActiveAdmin.register TeacherSurvey do
  permit_params :name, :form_embed_code, :description

  index do
    selectable_column
    id_column
    column :name
    column :form_embed_code
    column :description
    actions
  end

  filter :name

  form do |f|
    f.inputs "Teacher Survey Details" do
      f.input :name
      f.input :form_embed_code
      f.input :description
    end
    f.actions
  end
end
