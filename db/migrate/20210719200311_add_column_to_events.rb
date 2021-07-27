class AddColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :num_tickets, :integer, null: false, default: 0
  end
end
