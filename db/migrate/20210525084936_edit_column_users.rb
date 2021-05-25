class EditColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :provider_picture, :string
    remove_column :users, :avatar_id
  end
end
