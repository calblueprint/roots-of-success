ActiveAdmin.register TeacherSurvey do
  permit_params :name, :url, :description

  index do
    selectable_column
    id_column
    column :name
    column :url
    column :description
    actions
  end

  filter :name

  form do |f|
    f.inputs "Teacher Survey Details" do
      f.input :name
      f.input :url
      f.input :description
    end
    f.actions
  end
end
