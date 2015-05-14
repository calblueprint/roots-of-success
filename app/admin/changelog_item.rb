ActiveAdmin.register ChangelogItem do
  permit_params :text

  index do
    selectable_column
    id_column
    column :created_at
    column :text
    actions
  end

  filter :created_at

  form do |f|
    f.inputs "Changelog Item Details" do
      f.input :text
    end
    f.actions
  end
end
