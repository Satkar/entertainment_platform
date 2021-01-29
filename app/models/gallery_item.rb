# This class represnets GalleryItem in the system
class GalleryItem < ApplicationRecord
  scope :ordered_by_creation, -> { order('created_at asc') }
  scope :movie_and_seasons, -> { where(type: ['Movie', 'Season']) }

  validates :plot, presence: true
  validates :title, presence: true
  
  # fetch and cache the data
  def self.fetch_and_cache
    Rails.cache.fetch("movies_and_seasons", expires_in: 12.hours) do
      self.movie_and_seasons.ordered_by_creation.as_json(include: [:purchase_options])
    end
  end
end
