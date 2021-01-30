##
# This class contains GalleryItems related actions
module Api
  module V1
    class GalleryItemsController < ApplicationController
      
      # Lists movies and seasons in the system
      def index
        movies_and_seasons = GalleryItem.fetch_and_cache
        render json: movies_and_seasons
      end

    end
  end
end