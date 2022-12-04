class Rentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :longitude , :float
    add_column :rentals, :latitude, :float
  end
end
