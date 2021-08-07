class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :event_id,    null: false, default: 0
      t.integer :num_tickets, null: false, default: 0
      t.integer :user_id,     null: false, default: 0

      t.timestamps
    end
  end
end
