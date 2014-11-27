class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name, :null => false
      t.references :user, index: true, :null => false

      t.timestamps
    end

    add_reference :receipts, :profile, index:true
  end
end
