class RenamePurchaseTypeToReceiptCategory < ActiveRecord::Migration
  def change
    rename_column :purchase_types, :name, :category
    rename_column :receipts, :purchase_type_id, :category_id
    rename_table :purchase_types, :receipt_categories
  end
end