class ApplicationController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::ActiveRecord::RecordInvalid, with: :unprocessable_entity

  before_action :set_pagination_params
  
  private 
  def record_not_found(exception) 
    render json: {error: "Couldn't find #{exception.model} with 'id'=#{exception.id}"}.to_json, status: 404
  end 

  def unprocessable_entity(exception)
    render json: {error: exception.message}.to_json, status: 400
  end

  def set_pagination_params
    params[:page] = params[:page] || 1
    params[:per_page] = params[:per_page] || 25
  end

  def apply_pagination(collection)
    collection.paginate(
      page: params[:page], 
      per_page: params[:per_page]
    )
  end
end
