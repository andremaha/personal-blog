class Site < ApplicationRecord
  validates :title, presence: true

  DEFAULTS = {
    title: "Andrey Esaulov",
    tagline: "Software engineer. Writing about code, technology, and ideas.",
    meta_description: "A personal blog"
  }.freeze

  def self.current
    first || create!(DEFAULTS)
  end
end
