class AddColumnToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :booking_id, :integer, default: 0, null: false
  end
end
