# This class represnets Movie in the system
class Movie < GalleryItem
    has_many :gallery_items_purchase_options, foreign_key: 'gallery_item_id', dependent: :destroy
    has_many :purchase_options, through: :gallery_items_purchase_options

    after_commit :flush_cache

    # cache the result
    def self.fetch_and_cache
      Rails.cache.fetch("movies", expires_in: 12.hours) do
        self.ordered_by_creation.includes(:purchase_options).as_json(
          only: [:id, :title, :plot, :type, :created_at], 
            include: [purchase_options: {
              only: [:id, :price, :video_quality]
            }
          ]
        ).to_a
      end
    end
  
    private
    # clear the cache
    def flush_cache
      Rails.cache.delete('movies')
      Rails.cache.delete('movies_and_seasons')
    end

  end
  