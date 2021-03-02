class Api::V1::PlacesController < ApplicationController
  before_action :authenticate, only: [:create]
  
  def create
    place = Place.new
    place.name = params[:name]
    place.street = params[:street]
    place.country = params[:country]
    place.city = params[:city]
    place.save!

    render json: place.as_json(only: fields_only), status: :created
  end

  def fields_only
    [:id, :name, :city, :street, :country,
      :latitude, :longitude]
  end
end