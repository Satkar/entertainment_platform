##
# This class contains Movies related actions
module Api
  module V1
    class MoviesController < ApplicationController
      
      # Lists Movies in the syetem 
      def index
        movies = Movie.fetch_and_cache.paginate(
          page: params[:page], 
          per_page: params[:per_page]
        )
        
        movies = movies.as_json(
          only: [:id, :title, :plot, :created_at], 
          include: [ purchase_options: { only: [:id, :price, :video_quality] } ]
        )
        render json: movies
      end

    end
  end
end