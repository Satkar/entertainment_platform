# This class represnets Episode in the system
class Episode < GalleryItem
  belongs_to :season

  default_scope { order('serial_num asc') }
  
  after_commit :delete_clear_cache

  validates :serial_num, presence: true
  validates :season_id, presence: true

  private
  # clear the cache
  def delete_clear_cache
    Rails.cache.delete('seasons_with_episodes')
  end

end