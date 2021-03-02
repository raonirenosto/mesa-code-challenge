class Api::V1::UsersController < ApplicationController
  before_action :authenticate, only: [:show, :update]

  def show
    user = User.find(params[:id])
    render json: user.as_json(only: fields_only), status: :ok
  end

  def create
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.save!

    render json: user.as_json(only: fields_only), status: :created
  end

  def update
    user = User.find(params[:id])
    user.email = params[:email]
    user.password = params[:password]
    user.save!

    render json: user.as_json(only: fields_only), status: :ok
  end

  def fields_only
    [:id, :email]
  end
end