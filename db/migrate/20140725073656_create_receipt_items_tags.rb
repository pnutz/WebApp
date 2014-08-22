class CreateReceiptItemsTags < ActiveRecord::Migration
  def change
    create_table :receipt_items_tags, id: false do |t|
      t.belongs_to :receipt_item
      t.belongs_to :tag
    end

    add_index :receipt_items_tags, [:receipt_item_id, :tag_id]
  end
end
