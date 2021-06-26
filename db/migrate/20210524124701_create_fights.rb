class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.integer :fighter_a_id, null: false
      t.integer :fighter_b_id, null: false
      t.integer :style_id, null: false
      t.string :weight, null: false, default: ""
      t.string :result, null: false, default: ""
      t.boolean :draw, null: false, default: false
      t.integer :winner_id, null: false, default: 0
      t.text :info, null: false, default: ""
      t.integer :event_id

      t.timestamps
    end
  end
end
