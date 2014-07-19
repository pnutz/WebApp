class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_table :receipts_tags, id: false do |t|
      t.belongs_to :tag
      t.belongs_to :receipt
    end

    add_index :receipts_tags, [:receipt_id, :tag_id]
  end
end
