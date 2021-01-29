##
# This class contains Movies related actions
module Api
  module V1
    class MoviesController < ApplicationController
      
      def index
        movies = Movie.fetch_and_cache
        render json: movies
      end

    end
  end
end