class Post < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug, if: -> { slug.blank? && title.present? }

  PER_PAGE = 10

  scope :published, -> { where.not(published_at: nil).where(published_at: ..Time.current).order(published_at: :desc) }
  scope :draft, -> { where(published_at: nil).order(updated_at: :desc) }

  def self.page(page_number)
    page_number = [ page_number.to_i, 1 ].max
    offset_val = (page_number - 1) * PER_PAGE
    limit(PER_PAGE + 1).offset(offset_val)
  end

  def published?
    published_at.present? && published_at <= Time.current
  end

  def to_param
    slug
  end

  private

  def generate_slug
    base_slug = title.parameterize
    self.slug = base_slug
    counter = 1
    while Post.where(slug: self.slug).where.not(id: id).exists?
      self.slug = "#{base_slug}-#{counter}"
      counter += 1
    end
  end
end
