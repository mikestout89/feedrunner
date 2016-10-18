ActiveAdmin.register Feed do
  permit_params :email, :first_name, :last_name, :ip, :category

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :ip
    column :category
    column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :created_at

  form do |f|
    f.inputs "Feed Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :ip
      f.input :category
    end
    f.actions
  end

end
