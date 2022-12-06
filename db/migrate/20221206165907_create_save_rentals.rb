class CreateSaveRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :save_rentals do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :rental, null: false, foreign_key: true
      t.boolean :isSave

      t.timestamps
    end
  end
end
