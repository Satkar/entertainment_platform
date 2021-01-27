# This class represnets Movie in the system
class Movie < GalleryItem
    after_commit :delete_clear_cache

    # cache the result
    def self.fetch_and_cache
      Rails.cache.fetch("movies", expires_in: 12.hours) do
        self.all
      end
    end
  
    private
    # clear the cache
    def delete_clear_cache
      Rails.cache.delete('movies')
      Rails.cache.delete('movies_and_seasons')
    end

  end
  