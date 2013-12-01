class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.decimal :total
      t.string :transaction_number
      t.references :purchase_type, index: true
      t.string :title
      t.references :folder, index: true
      t.text :note
      t.references :vendor, index: true
      t.references :currency, index: true

      t.timestamps
    end
  end
end
