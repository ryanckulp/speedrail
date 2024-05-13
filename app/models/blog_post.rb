class BlogPost < ApplicationRecord
  has_one_attached :cover_image
  has_rich_text :body

  scope :published, -> { where(draft: false) }
  scope :drafts, -> { where(draft: true) }

  before_validation :generate_unique_slug
  validates :slug, uniqueness: true
  validates_presence_of :title, :slug, :body, :description

  def to_param
    slug
  end

  # :nocov:
  def self.ransackable_attributes(_auth_object)
    ["created_at", "description", "draft", "id", "id_value", "slug", "title", "updated_at"]
  end
  # :nocov:

  private

  def generate_unique_slug
    return unless new_record? || slug_changed?

    intended_slug = slug.downcase.parameterize
    self.slug = intended_slug

    self.slug = "#{intended_slug}-#{SecureRandom.hex(3)}" while BlogPost.excluding(self).exists?(slug: self.slug)
  end
end
