class BookingSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :email, :message, :isBooked
  belongs_to :meeting
  belongs_to :user
  belongs_to :rental
end
