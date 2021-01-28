##
# This class contains Seasons related actions
module Api
  module V1
    class SeasonsController < ApplicationController
      
      def index
        seasons = Season.fetch_and_cache
        render json: seasons
      end

    end
  end
end