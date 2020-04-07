class Route < ApplicationRecord
  has_many :events

  def self.for_slug(slug)
    where(slug: slug).first
  end
end
