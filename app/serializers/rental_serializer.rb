class RentalSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :address, :area_sqft, :category, :starting_date, :image, :requirements, :note, :status, :parking, :near_subway, :features, :location, :phone, :email, :utility, :description, :latitude, :longitude
  belongs_to :user
end
