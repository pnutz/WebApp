class CreatePurchaseTypes < ActiveRecord::Migration
  def change
    create_table :purchase_types do |t|
      t.string :name, :unique => true, :null =>false

      t.timestamps
    end
  end
end
