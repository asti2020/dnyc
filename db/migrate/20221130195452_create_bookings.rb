class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :meeting, null: false, foreign_key: true
      t.string :name
      t.date :date
      t.time :time
      t.string :email
      t.text :message
      t.references :user, null: false, foreign_key: true
      t.references :rental, null: false, foreign_key: true
      t.boolean :isBooked

      t.timestamps
    end
  end
end
