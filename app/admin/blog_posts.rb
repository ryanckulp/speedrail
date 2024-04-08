ActiveAdmin.register BlogPost do
  menu priority: 4

  # For security, limit the actions that should be available
  actions :index

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
    column 'cover image' do |blog_post|
      if blog_post.cover_image.persisted?
        link_to blog_post.cover_image, target: :_blank do
          image_tag blog_post.cover_image, class: 'w-60 border'
        end
      end
    end
    column :title
    column :slug
    column 'status' do |blog_post|
      blog_post.draft? ? 'Draft' : 'Published'
    end
    column :created_at
    column :updated_at

    actions
  end
end
