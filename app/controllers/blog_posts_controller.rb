class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[show edit update destroy]
  before_action :require_admin!, only: %i[new edit create update destroy]
  # before_action :authenticate_user!, only: %i[new create edit update destroy]

  # GET /blog_posts
  def index
    @blog_posts = BlogPost.where(draft: false).order(created_at: :asc)
    @drafts = BlogPost.where(draft: true).order(created_at: :desc)
  end

  # GET /blog_posts/slug
  def show; end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog_posts/slug/edit
  def edit; end

  # POST /blog_posts
  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to blog_post_path(@blog_post.slug), notice: "Blog post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blog_posts/slug
  def update
    @blog_post.slug = params[:blog_post][:slug]
    if @blog_post.save && @blog_post.update(blog_post_params)
      redirect_to blog_post_path(@blog_post.slug), notice: "Blog post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /blog_posts/1
  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: "Blog post was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog_post
    slug = params[:blog_post].present? ? params[:blog_post][:slug] : params[:slug]
    @blog_post = BlogPost.find_by!(slug: slug)
  end

  # Only allow a list of trusted parameters through, but add :body, and use slug instead of id in the URL.
  def blog_post_params
    params.require(:blog_post).permit(:title, :slug, :description, :body, :cover_image, :draft)
  end

  def require_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end
end
