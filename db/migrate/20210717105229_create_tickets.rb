class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :event_id, default: 0, null: false
      t.integer :booking_id, default: 0, null: false
      t.float :price, default: 0, null: false
      t.string :name, default: "", null: false
      t.string :email, default: "", null: false

      t.timestamps
    end
  end
end
