class CreateSignUps < ActiveRecord::Migration[6.1]
  def change
    create_table :sign_ups do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end

    add_index :sign_ups, :user_id
    add_index :sign_ups, :event_id
  end
end
