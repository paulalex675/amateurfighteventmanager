class EditNotifications < ActiveRecord::Migration[6.1]
  def change
    change_table :notifications do |t|
      t.rename :notification_target, :recipient_id
      t.string :action
    end

  end
end
