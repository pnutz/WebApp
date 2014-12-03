class RemoveIsCreditFromReceiptItems < ActiveRecord::Migration
  def change
    remove_column :receipt_items, :is_credit, :boolean
  end
end
