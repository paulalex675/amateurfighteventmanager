class EditFightsColumnStyleId < ActiveRecord::Migration[6.1]
  def change
    remove_column "fights", "style_id"
    add_column "fights", "style_id", "string", null: false, default: ""
  end
end
