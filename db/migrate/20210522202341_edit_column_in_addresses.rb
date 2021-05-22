class EditColumnInAddresses < ActiveRecord::Migration[6.1]
  def change
    change_table :addresses do |t|
      t.rename :gym_id, :hostable_id
    end
  end
end
