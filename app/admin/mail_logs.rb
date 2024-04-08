ActiveAdmin.register MailLog do
  menu priority: 5

  # Specify parameters which should be permitted for assignment
  permit_params :user_id, :mailer, :to, :subject, :body

  # For security, limit the actions that should be available
  actions :index

  # Add or remove filters to toggle their visibility
  filter :to
  filter :subject
  filter :body
  filter :mailer
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visiblity in the index action
  index do
    id_column
    column :user
    column :mailer
    column :to
    column :subject
    column 'body' do |ml|
      ml.body.html_safe
    end
    column :created_at
    actions
  end
end
