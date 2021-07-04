class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address1, null: false, default: ""
      t.string :address2, null: false, default: ""
      t.string :town_or_city, null: false, default: ""
      t.string :county, null: false, default: ""
      t.string :post_code, null: false, default: ""
      t.string :country, null: false, default: ""
      t.integer :hostable_id, null: false, default: 0
      t.string :hostable_type, null: false, default: ""

      t.timestamps
    end
  end
end
