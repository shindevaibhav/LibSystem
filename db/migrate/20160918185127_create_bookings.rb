class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.datetime :slot_start

      t.references :member
      t.references :room
      t.timestamps
    end
  end
end
