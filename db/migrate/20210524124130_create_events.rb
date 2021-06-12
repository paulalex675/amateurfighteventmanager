class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :gym_id
      t.datetime :event_date, null: false, default: ""
      t.string :event_name, null: false, default: ""
      t.text :event_info, null: false, default: ""

      t.timestamps
    end
  end
end
