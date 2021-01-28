# This class represnets GalleryItem in the system
class GalleryItem < ApplicationRecord
  scope :ordered_by_creation, -> { order('created_at asc') }

  validates :plot, presence: true
  validates :title, presence: true
  
  # fetch and cache the data
  def self.fetch_and_cache
    Rails.cache.fetch("movies_and_seasons", expires_in: 12.hours) do
      all
    end
  end
end
