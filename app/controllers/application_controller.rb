class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :bad_request
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def bad_request(exception)
    render json: {
      error_message: exception.message
    }, status: :bad_request
  end

  def not_found(exception)
    render json: {
      error_message: exception.message
    }, status: :not_found
  end
end
