class Api::V1::UsersController < ApplicationController
  def create
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.save!

    render json: user.as_json(only: [:id, :email]), status: :created
  end
end