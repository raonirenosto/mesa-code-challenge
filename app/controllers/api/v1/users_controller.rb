class Api::V1::UsersController < ApplicationController
  before_action :authenticate, only: [:show]

  def show
    user = User.find(params[:id])
    render json: user.as_json(only: [:id, :email]), status: :ok
  end

  def create
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.save!

    render json: user.as_json(only: [:id, :email]), status: :created
  end
end