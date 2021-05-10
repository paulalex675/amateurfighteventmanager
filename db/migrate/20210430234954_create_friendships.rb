class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.integer :user_a_id
      t.integer :user_b_id
      t.index :user_a_id
      t.index :user_b_id

      t.timestamps
    end
  end
end
