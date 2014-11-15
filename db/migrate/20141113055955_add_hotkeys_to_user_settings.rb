class AddHotkeysToUserSettings < ActiveRecord::Migration
  def change
    add_column :user_settings, :hotkey_receipt, :integer
    add_column :user_settings, :hotkey_vault, :integer
  end
end
