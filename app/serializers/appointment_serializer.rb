class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :isAppoint, :time, :start_time, :status, :notes, :slot
  has_one :rental
  has_one :user
end
