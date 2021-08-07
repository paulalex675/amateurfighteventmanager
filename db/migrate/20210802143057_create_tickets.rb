class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :booking_id, null: false, default: 0
      t.string :name,        null: false, default: ""
      t.string :email,       null: false, default: ""

      t.timestamps
    end
  end
end
