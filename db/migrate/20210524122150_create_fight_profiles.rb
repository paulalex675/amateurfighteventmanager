class CreateFightProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :fight_profiles do |t|
      t.integer :user_id,     null: false, default: ""
      t.string :ring_name,    null: false, default: ""
      t.integer :style_id
      t.integer :gym_id,      null: false, default: ""
      t.string :gender,       null: false, default: ""
      t.string :fight_weight, null: false, default: ""

      t.timestamps
    end
  end
end
