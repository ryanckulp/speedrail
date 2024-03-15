class BlogPost < ApplicationRecord
  has_one_attached :cover_image
  has_rich_text :body
  validates :slug, uniqueness: true
  before_validation :generate_unique_slug
  validates_presence_of :title, :slug, :body, :description

  def to_param
    slug
  end

  private

  def generate_unique_slug
    return unless new_record? || title_changed?

    intended_slug = slug.blank? ? title&.parameterize : slug.downcase.parameterize
    self.slug = intended_slug

    self.slug = "#{intended_slug}-#{SecureRandom.hex(3)}" while BlogPost.exists?(slug: self.slug)
  end
end
