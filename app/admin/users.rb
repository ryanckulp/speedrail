ActiveAdmin.register User do
  menu priority: 3

  # Specify parameters which should be permitted for assignment
  permit_params :email, :admin, :stripe_customer_id, :stripe_subscription_id

  # For security, limit the actions that should be available
  actions :all, except: [:new]

  member_action :impersonate, method: :get do
    user = User.find(params[:id])
    impersonate_user(user)
    redirect_to account_index_path
  end

  # Add or remove filters to toggle their visibility
  filter :email
  filter :created_at
  filter :updated_at
  filter :admin
  filter :paying_customer

  # Add or remove columns to toggle their visiblity in the index action
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    column :paying_customer
    column 'Impersonate' do |user|
      link_to 'Login', impersonate_admin_user_path(user.id)
    end
    column :admin
    actions
  end

  # Add or remove rows to toggle their visiblity in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :email
      row :encrypted_password
      row :reset_password_token
      row :reset_password_sent_at
      row :remember_created_at
      row :created_at
      row :updated_at
      row :admin
      row :stripe_customer_id
      row :stripe_subscription_id
      row :paying_customer
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :email
      f.input :admin
      f.input :stripe_customer_id
      f.input :stripe_subscription_id
    end
    f.actions
  end
end
