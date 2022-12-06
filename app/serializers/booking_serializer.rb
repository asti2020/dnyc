class BookingSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :email, :message, :isBooked, :startDate, :endDate
  belongs_to :user
  belongs_to :rental
end
