class RemoveTitleFromReceipts < ActiveRecord::Migration
  def change
    remove_column :receipts, :title, :string
  end
end
