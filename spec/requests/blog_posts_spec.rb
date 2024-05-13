require 'rails_helper'

RSpec.describe "Blog Posts", type: :request do
  before do
    @blog_post = create(:blog_post)
    @user = create(:user)
  end

  let(:valid_attributes) do
    { blog_post: { title: 'New title', slug: @blog_post.slug } }
  end

  describe "GET /index" do
    it "returns all blog posts" do
      get blog_posts_path
      expect(response).to have_http_status(200)

      expect(response.body).to include(@blog_post.title)
      expect(response.body).to include(@blog_post.description)
      expect(response.body).to_not include(@blog_post.body.to_plain_text)
    end
  end

  describe "GET show" do
    it "returns a blog post" do
      get blog_post_path(@blog_post)
      expect(response).to have_http_status(200)

      expect(response.body).to include(@blog_post.title)
      expect(response.body).to include(@blog_post.description)
      expect(response.body).to include(@blog_post.body.to_plain_text)

      expect(response.body).to_not include(@blog_post.slug)
      expect(response.request.url).to include(@blog_post.slug)
    end
  end

  describe "PATCH /update" do
    it "updates a blog post title as Admin" do
      @user.update(admin: true)
      sign_in(@user)

      patch blog_post_path(slug: @blog_post.slug, id: @blog_post.id), params: valid_attributes
      expect(response).to redirect_to(blog_post_path(@blog_post.slug))

      follow_redirect!

      expect(response.body).to include(valid_attributes[:blog_post][:title])
    end

    it "does not update a blog post title as non Admin" do
      @user.update(admin: false)
      old_title = @blog_post.title

      patch blog_post_path(slug: @blog_post.slug, id: @blog_post.id), params: valid_attributes

      expect(response).to redirect_to(root_path)

      follow_redirect!

      expect(response.body).to include('You are not authorized')
      expect(@blog_post.reload.title).to eql old_title
    end

    it "dynamically fixes a duplicate blog post slug" do
      @user.update(admin: true)
      sign_in(@user)
      blog_post_2 = create(:blog_post, slug: 'something-new')

      patch blog_post_path(slug: blog_post_2.slug, id: blog_post_2.id), params: { blog_post: { slug: @blog_post.slug }}
      expect(response).to redirect_to(blog_post_path(blog_post_2.reload.slug))

      follow_redirect!

      expect(response.request.url).to include(blog_post_2.slug)
      expect(response.request.url).to include(@blog_post.slug)
    end
  end

  describe "DELETE /destroy" do
    it "destroys a blog post as Admin" do
      @user.update(admin: true)
      sign_in(@user)

      expect do
        delete blog_post_path(id: @blog_post.id, slug: @blog_post.slug)
      end.to change(BlogPost, :count).by(-1)
    end

    it "does not destroy a blog post as non Admin" do
      @user.update(admin: false)
      sign_in(@user)

      expect do
        delete blog_post_path(id: @blog_post.id, slug: @blog_post.slug)
      end.to change(BlogPost, :count).by(0)

      follow_redirect!

      expect(response.body).to include('You are not authorized')
    end

    it "does not destroy a blog post as logged out, non Admin" do
      expect do
        delete blog_post_path(id: @blog_post.id, slug: @blog_post.slug)
      end.to change(BlogPost, :count).by(0)

      follow_redirect!

      expect(response.body).to include('You are not authorized')
    end
  end
end
