class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.datetime :slot_start

      t.references :member, foreign_key: {on_delete: :cascade}
      t.references :room, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
