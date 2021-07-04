class CreateFightRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :fight_records do |t|
      t.integer :user_id
      t.integer :style_id
      t.integer :win, null: false, default: 0
      t.integer :draw, null: false, default: 0
      t.integer :lose, null: false, default: 0
      t.integer :fight_score, null: false, default: 0

      t.timestamps
    end
  end
end
