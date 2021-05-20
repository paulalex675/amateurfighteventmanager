class CreateGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :gyms do |t|
      t.integer :user_id
      t.string :name
      t.string :primary_style
      t.string :email
      t.string :website
      t.string :telephone

      t.timestamps
    end
  end
end
