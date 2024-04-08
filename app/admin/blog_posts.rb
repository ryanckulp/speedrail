ActiveAdmin.register BlogPost do
  menu priority: 4

  # Specify parameters which should be permitted for assignment
  permit_params :title, :slug, :description, :draft, :body

  # or consider:
  #
  # permit_params do
  #   permitted = [:title, :slug, :description, :draft]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :index, :destroy

  # Add or remove filters to toggle their visibility
  filter :id
  filter :title
  filter :slug
  filter :description
  filter :draft
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visiblity in the index action
  index do
    selectable_column
    id_column
    column :title
    column :slug
    column 'status' do |blog_post|
      blog_post.draft? ? 'Draft' : 'Published'
    end
    column :created_at
    column :updated_at

    actions
  end

  # Add or remove rows to toggle their visiblity in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :title
      row :slug
      row :description
      row :draft
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :title
      f.input :slug
      f.input :description
      f.input :draft
      f.input :body
    end
    f.actions
  end
end
