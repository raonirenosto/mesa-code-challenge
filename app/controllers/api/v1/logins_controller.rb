class Api::V1::LoginsController < ApplicationController
  def create
    user = authenticate_user params[:email], params[:password]

    if user
      token = encode user.id
      render json: { token: token, user_id: user.id }, status: :ok
    else
      head :unauthorized
    end
  end
end