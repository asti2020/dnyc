class RemoveMeetingFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :meeting, null: false, foreign_key: true
  end
end