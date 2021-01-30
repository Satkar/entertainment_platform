##
# This class contains Purchases related actions
module Api
  module V1
    class PurchasesController < ApplicationController
      before_action :set_user, only: [:index, :create]
      before_action :set_gallery_item, :set_purchase_option, only: [:create]

      # Lists purchases of the specified user
      def index
        library = @user.library
        render json: library
      end

      # Allows to create a new purchase against user
      def create
        if @user.purchase_now(@gallery_item, @purchase_option)
          render json: { message: "Subscribed successfully." }  
        else
          render json: { message: "Your previous subscription is still active!" }  
        end
      end

      private 

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_gallery_item
        @gallery_item = GalleryItem.find(params[:gallery_item_id])
      end

      def set_purchase_option
        @purchase_option = @gallery_item.purchase_options.find(params[:purchase_option_id])
      end

    end
  end
end