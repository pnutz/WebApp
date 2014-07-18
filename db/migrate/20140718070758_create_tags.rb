class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_table :tags_receipts, id: false do |t|
      t.belongs_to :tag
      t.belongs_to :receipt
    end

    add_index :tags_receipts, [:tag_id, :receipt_id]
  end
end
