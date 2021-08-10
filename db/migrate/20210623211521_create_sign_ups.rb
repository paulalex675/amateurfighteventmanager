class CreateSignUps < ActiveRecord::Migration[6.1]
  def change
    create_table :sign_ups do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.boolean :matched?, default: false, null: false

      t.timestamps
    end

    add_index :sign_ups, :user_id
    add_index :sign_ups, :event_id
  end
end
