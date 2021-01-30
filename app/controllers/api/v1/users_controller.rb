##
# This class contains Seasons related actions
module Api
  module V1
    class UsersController < ApplicationController
      
      # Allows to create a new user in the system 
      def create
        user = User.create!(user_params)
        render json: user
      end

      # Lists the available users in the system
      def index
        users = User.fetch_and_cache.paginate(
          page: params[:page], 
          per_page: params[:per_page]
        )

        users = users.as_json(only: [:id, :email])
        render json: users
      end

      private
      def user_params
        params.require(:user).permit(:email)
      end
    end
  end
end