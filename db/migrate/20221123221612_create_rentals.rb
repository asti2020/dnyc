class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.string :title
      t.float :price
      t.string :address
      t.string :area_sqft
      t.string :category
      t.date :starting_date
      t.string :image
      t.string :requirements
      t.belongs_to :user, null: false, foreign_key: true
      t.string :note
      t.boolean :status
      t.string :parking
      t.string :near_subway
      t.string :features
      t.string :location
      t.string :phone
      t.string :email
      t.string :utility
      t.string :description
      t.timestamps
    end
  end
end
