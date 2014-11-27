class AddSubtotalToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :subtotal, :decimal, precision: 19, scale: 4
    change_column :receipts, :total, :decimal, precision: 19, scale: 4
  end
end
