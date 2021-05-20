class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :town_or_city
      t.string :county
      t.string :post_code
      t.string :country
      t.integer :gym_id

      t.timestamps
    end
  end
end
