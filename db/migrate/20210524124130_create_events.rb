class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :gym_id
      t.datetime :event_date
      t.string :event_name
      t.text :event_info

      t.timestamps
    end
  end
end
