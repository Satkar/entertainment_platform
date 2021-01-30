##
# This class contains GalleryItems related actions
module Api
  module V1
    class GalleryItemsController < ApplicationController
      
      # Lists movies and seasons in the system
      def index
        movies_and_seasons = GalleryItem.fetch_and_cache.paginate(
          page: params[:page], 
          per_page: params[:per_page]
        )

        movies_and_seasons = movies_and_seasons.as_json(
          only: [:id, :title, :plot, :type, :created_at], 
            include: [purchase_options: {
              only: [:id, :price, :video_quality]
            }
          ]
        )

        render json: movies_and_seasons
      end

    end
  end
end