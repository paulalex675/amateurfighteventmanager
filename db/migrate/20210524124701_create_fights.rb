class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.integer :fighter_a_id
      t.integer :fighter_b_id
      t.integer :style_id
      t.string :weight, null: false, default: ""
      t.string :result, null: false, default: ""
      t.boolean :draw, null: false, default: ""
      t.integer :winner, null: false, default: ""
      t.text :info, null: false, default: ""
      t.integer :event_id

      t.timestamps
    end
  end
end
