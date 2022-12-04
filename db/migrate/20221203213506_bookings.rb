class Bookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :startDate , :datetime
    add_column :bookings, :endDate , :datetime
  end
end
