class BlogPostsController < ApplicationController
  before_action :set_blog_post, except: %i[index new create]
  before_action only: [:new, :edit, :create, :update, :destroy] do
    authenticate_admin!(alert_message: 'You are not authorized')
  end

  # GET /blog
  def index
    @blog_posts = BlogPost.published.order(created_at: :asc)
    @drafts = BlogPost.drafts.order(created_at: :desc)
  end

  # GET /blog/:slug
  def show; end

  # GET /blog/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog/:slug/edit
  def edit; end

  # POST /blog
  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to blog_post_path(@blog_post.slug), notice: "Blog post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH /blog/:slug
  def update
    if @blog_post.update(blog_post_params)
      redirect_to blog_post_path(@blog_post.slug), notice: "Blog post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /blog/:slug
  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: "Blog post was successfully destroyed."
  end

  private

  def set_blog_post
    @blog_post = params[:blog_post].present? ? BlogPost.find(params[:id]) : BlogPost.find_by(slug: params[:slug])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :slug, :description, :body, :cover_image, :draft)
  end
end
