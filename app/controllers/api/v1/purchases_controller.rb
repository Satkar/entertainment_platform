##
# This class contains Purchases related actions
module Api
  module V1
    class PurchasesController < ApplicationController
      before_action :set_user, only: [:index, :create]
      before_action :set_gallery_item, :set_purchase_option, only: [:create]

      # Lists purchases of the specified user
      def index
        library = @user.library.paginate(
          page: params[:page], 
          per_page: params[:per_page]
        )

        library = library.as_json(
          only: [:id, :expires_at], 
          include: [ 
            gallery_item: { only: [:title, :plot, :type] }, 
            purchase_option: { only: [:id, :price, :video_quality] }
          ]
        )
        render json: library
      end

      # Allows to create a new purchase against user
      def create
        subscription = @user.purchase_now(@gallery_item, @purchase_option)
        if subscription == true
          render json: { message: "Subscribed successfully." }  
        else
          render json: { message: "Your can try this subscription after #{subscription}!" }, status: 409 
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