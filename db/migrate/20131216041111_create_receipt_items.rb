class CreateReceiptItems < ActiveRecord::Migration
  def change
    create_table :receipt_items do |t|
      t.references :receipt, index: true
      t.references :item_type, index: true
      t.decimal :cost, precision: 19, scale: 4
      t.integer :quantity
      t.boolean :is_credit

      t.timestamps
    end
  end
end
