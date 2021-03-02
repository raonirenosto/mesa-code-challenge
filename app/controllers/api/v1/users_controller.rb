class Api::V1::UsersController < ApplicationController
  def create
    user = User.new
    user.email = params[:email]
    user.password = params[:password]

    render json: user, status: :created
  end
end