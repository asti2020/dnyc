class BookingSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :email, :message, :isBooked
  has_one :meeting
  has_one :user
  has_one :rental
end
