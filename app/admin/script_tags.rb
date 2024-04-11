ActiveAdmin.register ScriptTag do
  menu priority: 6

  # Specify parameters which should be permitted for assignment
  permit_params :name, :code, :enabled

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :name
  filter :enabled

  # Add or remove columns to toggle their visiblity in the index action
  index do
    selectable_column
    id_column
    column :name
    column :code
    column :enabled
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visiblity in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :name
      row :code
      row :enabled
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :name
      f.text_area :code
      f.input :enabled
    end
    f.actions
  end
end
