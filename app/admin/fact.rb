ActiveAdmin.register Fact do
  permit_params :name, :date, :description, :relevance, :active

  index do
    selectable_column
    id_column
    column :name
    column :date
    column :description
    column :relevance
    column :active
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :date
      f.input :description
      f.input :relevance
      f.input :active
    end
    f.actions
  end
end
