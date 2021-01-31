##
# This class contains Movies related actions
module Api
  module V1
    class MoviesController < ApplicationController
      
      # Lists Movies in the syetem 
      def index
        movies = apply_pagination Movie.fetch_and_cache

        movies = movies.as_json(
          only: [:id, :title, :plot, :created_at], 
          include: [ purchase_options: { only: [:id, :price, :video_quality] } ]
        )
        render json: movies
      end

    end
  end
end