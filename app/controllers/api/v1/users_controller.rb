##
# This class contains Seasons related actions
module Api
  module V1
    class UsersController < ApplicationController
      
      def create
        user = User.create!(user_params)
        render json: user
      end

      def index
        users = User.all.as_json
        render json: users
      end

      private
      def user_params
        params.require(:user).permit(:email)
      end
    end
  end
end