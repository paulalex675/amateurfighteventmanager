class AddColumnToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :ticket_price, :float, default: 0.0
  end
end
