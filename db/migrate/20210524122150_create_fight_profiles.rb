class CreateFightProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :fight_profiles do |t|
      t.integer :user_id
      t.string :ring_name
      t.string :style
      t.integer :gym_id
      t.string :gender
      t.string :fight_weight

      t.timestamps
    end
  end
end
