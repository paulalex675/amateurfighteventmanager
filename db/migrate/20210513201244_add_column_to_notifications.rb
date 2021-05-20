class AddColumnToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :actor_id, :integer
    add_column :notifications, :read_at, :datetime
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
