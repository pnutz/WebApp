class AddUserIdToFolderType < ActiveRecord::Migration
  def change
    add_column :folder_types, :user_id, :integer
  end
end
