class Place < ApplicationRecord
  after_validation :geocode
  geocoded_by :full_address

  validates :name, :street, :country, :city, presence: true

  def full_address
    return [city, street, country].join(',')
  end
end
