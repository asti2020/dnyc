class Rental < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  belongs_to :user
  has_many :appointments
  has_many :save_rentals, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  def geocoded_by
    self.address = geocoded_by(:address)
  end

  # def geocode
  #   self.address = geocode_address(:address)
  # end

  # before_save :geocoded_address

  # def geocoded_address
  #   self.address = geocoded.formatted_address(self.address)
  #   self.save
  # end

#   reverse_geocoded_by :latitude, :longitude
# after_validation :reverse_geocode, :if => lambda{ |obj| obj.address_changed? }

  # def address
  #   [address].compact.join(', ')
  # end

  # def address_changed?
  #   street_changed? || city_changed? || state_changed? || country_changed?
  # end


    
end
