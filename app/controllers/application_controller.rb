class ApplicationController < ActionController::API
  include ExceptionHandler
  include LoginUtils

  def authenticate
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = decode(header)
      User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
