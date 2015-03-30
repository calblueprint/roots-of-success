ActiveAdmin.register Student do
  permit_params :email, :confirmed, :classroom_id, :survey_administered

  index do
    selectable_column
    id_column
    column :email
    column :classroom
    column :confirmed
    column :survey_administered
    actions
  end

  filter :email
  filter :classroom
  filter :confirmed
  filter :survey_administered

  form do |f|
    f.inputs "Student Details" do
      f.input :email
      f.input :classroom
      f.input :confirmed
      f.input :survey_administered
    end
    f.actions
  end
end
