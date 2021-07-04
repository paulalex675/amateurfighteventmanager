class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.bigint :notifiable_id
      t.string :notifiable_type, null: false, default: ""
      t.integer :recipient_id
      t.string :action
      t.datetime :read_at
      t.integer :actor_id

      t.timestamps
    end
  end
end
