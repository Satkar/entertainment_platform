# This class represnets seasons in the system
class Season < GalleryItem
  
  has_many :episodes, foreign_key: 'season_id', dependent: :destroy
  has_many :gallery_items_purchase_options, foreign_key: 'gallery_item_id', dependent: :destroy
  has_many :purchase_options, through: :gallery_items_purchase_options
  
  after_commit :delete_clear_cache

  # cache the result
  def self.fetch_and_cache
    Rails.cache.fetch("seasons_with_episodes", expires_in: 12.hours) do
      self.ordered_by_creation.includes(:episodes, :purchase_options)
    end
  end

  private
  # clear the cache
  def delete_clear_cache
    Rails.cache.delete('seasons_with_episodes')
    Rails.cache.delete('movies_and_seasons')
  end
end