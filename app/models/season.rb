# This class represnets seasons in the system
class Season < GalleryItem
  has_many :episodes, foreign_key: 'season_id', dependent: :destroy
  after_commit :delete_clear_cache

  # cache the result
  def self.fetch_and_cache
    Rails.cache.fetch("seasons_with_episodes", expires_in: 12.hours) do
      self.ordered_by_creation.as_json(include: :episodes)
    end
  end

  private
  # clear the cache
  def delete_clear_cache
    Rails.cache.delete('seasons_with_episodes')
    Rails.cache.delete('movies_and_seasons')
  end
end