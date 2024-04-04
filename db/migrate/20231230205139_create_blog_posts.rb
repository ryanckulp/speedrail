class CreateBlogPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.boolean :draft, null: false, default: false

      t.timestamps
    end
  end
end
