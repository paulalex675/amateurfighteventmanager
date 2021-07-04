class CreateGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :gyms do |t|
      t.integer :user_id
      t.string :name, null: false, default: ""
      t.integer :style_id
      t.string :email, null: false, default: ""
      t.string :website, null: false, default: ""
      t.string :telephone, null: false, default: ""
      t.integer :num_prems, null: false, default: 1

      t.timestamps
    end
  end
end
