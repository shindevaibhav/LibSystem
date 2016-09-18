class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.datetime :slot_start

      t.timestamps
    end
  end
end
