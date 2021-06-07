class AddColumnToFightRecord < ActiveRecord::Migration[6.1]
  def change
    add_column :fight_records, :fight_score, :integer, null: false, default: 0
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
