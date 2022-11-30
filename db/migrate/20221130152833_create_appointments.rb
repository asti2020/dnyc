class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.boolean :isAppoint
      t.string :time
      t.string :start_time
      t.string :status
      t.string :notes
      t.string :slot
      t.belongs_to :rental, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
