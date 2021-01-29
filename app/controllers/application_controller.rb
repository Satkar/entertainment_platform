class ApplicationController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::ActiveRecord::RecordInvalid, with: :unprocessable_entity
  
  private 
  def record_not_found(exception)
    render json: {error: exception.message}.to_json, status: 404
  end 

  def unprocessable_entity(exception)
    render json: {error: exception.message}.to_json, status: 400
  end 
end
