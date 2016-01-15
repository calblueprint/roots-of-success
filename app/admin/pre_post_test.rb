ActiveAdmin.register PrePostTest do
  permit_params :description, :link

  index do
    column :description
    column :link
    actions
  end

  form do |f|
    f.inputs "Pre/Post Test Details" do
      f.input :description
      f.input :link
    end
    f.actions
  end
end
