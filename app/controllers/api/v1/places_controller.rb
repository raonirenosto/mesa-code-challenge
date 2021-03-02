class Api::V1::PlacesController < ApplicationController
  before_action :authenticate, only: [:create,:index]

  def index
    places = []
    if params[:type] == "list"
      places = Place.all.order(:name)
    else
      latitude = params[:latitude]
      longitude = params[:longitude]
      places = Place.all.sort_by { |place| place.distance_to([latitude, longitude])}
    end

    render json: places.as_json(only: fields_only), status: :ok
  end
  
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
