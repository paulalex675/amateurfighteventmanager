class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.integer :fighter_a_id
      t.integer :fighter_b_id
      t.string :style
      t.string :weight
      t.string :result
      t.boolean :draw
      t.integer :winner
      t.text :info
      t.integer :event_id

      t.timestamps
    end
  end
end
