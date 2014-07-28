class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name, :null => false
      t.text :description 
      t.references :user, index: true, :null => false 
      t.references :folder_type, index: true, :null => true
      t.references :folder, index: true

      t.timestamps
    end
  end
end
