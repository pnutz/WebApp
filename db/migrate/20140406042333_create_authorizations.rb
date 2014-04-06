class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.integer :uid, :limit => 8 #big int 

      t.timestamps
    end
  end
end
