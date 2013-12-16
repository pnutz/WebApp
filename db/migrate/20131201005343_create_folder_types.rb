class CreateFolderTypes < ActiveRecord::Migration
  def change
    create_table :folder_types do |t|
      t.string :name, :unique => true, :null => false

      t.timestamps
    end
  end
end
