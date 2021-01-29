##
# This class contains Seasons related actions
module Api
  module V1
    class UsersController < ApplicationController
      
      def create
        user = User.create!(user_params)
        render json: user
      end

      private
      def user_params
        params.require(:user).permit(:email)
      end
    end
  end
end