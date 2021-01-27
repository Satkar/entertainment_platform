##
# This class contains GalleryItems related actions
module Api
  module V1
    class GalleryItemsController < ApplicationController
      
      def index
        movies_and_seasons = GalleryItem.fetch_and_cache.as_json
        render json: movies_and_seasons
      end

    end
  end
end