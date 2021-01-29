# This class represnets Movie in the system
class Movie < GalleryItem
    has_many :gallery_items_purchase_options, foreign_key: 'gallery_item_id', dependent: :destroy
    has_many :purchase_options, through: :gallery_items_purchase_options

    after_commit :delete_clear_cache

    # cache the result
    def self.fetch_and_cache
      Rails.cache.fetch("movies", expires_in: 12.hours) do
        self.ordered_by_creation.as_json(include: :purchase_options)
      end
    end
  
    private
    # clear the cache
    def delete_clear_cache
      Rails.cache.delete('movies')
      Rails.cache.delete('movies_and_seasons')
    end

  end
  