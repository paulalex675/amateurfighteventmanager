class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :event_id,                     null: false
      t.integer :user_id,                      null: false
      t.integer :number_of_guests, default: 1, null: false

      t.timestamps
    end
  end
end
