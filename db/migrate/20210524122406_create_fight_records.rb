class CreateFightRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :fight_records do |t|
      t.integer :user_id
      t.string :style
      t.integer :win
      t.integer :draw
      t.integer :lose

      t.timestamps
    end
  end
end
