class Api::V1::ReviewsController < ApplicationController
  before_action :authenticate, only: [:create]
  
  def create
    review = Review.new
    review.rating = params[:rating]
    review.comment = params[:comment]
    review.save!

    render json: review.as_json(only: fields_only), status: :created
  end

  def fields_only
    [:id, :rating, :comment]
  end
end
