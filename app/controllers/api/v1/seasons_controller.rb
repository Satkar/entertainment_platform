##
# This class contains Seasons related actions
module Api
  module V1
    class SeasonsController < ApplicationController
      
      # Lists seasons with episodes in the system
      def index
        seasons = apply_pagination Season.fetch_and_cache

        seasons = seasons.as_json(
          only: [:id, :title, :plot, :created_at],  
          include: [
            episodes: { only: [:id, :title, :plot, :serial_num,] } , 
            purchase_options: { only: [:id, :price, :video_quality] }
          ]
        )
        render json: seasons
      end

    end
  end
end