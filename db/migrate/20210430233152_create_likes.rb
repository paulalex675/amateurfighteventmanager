class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :liker_id
      t.integer :likeable_id
      t.string :likeable_type, null: false, default: ""

      t.timestamps
      add_index :likes, :likeable_type
      add_index :likes, :likeable_id
      #Ex:- add_index("admin_users", "username")
    end
  end
end
