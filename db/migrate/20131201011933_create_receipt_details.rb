class CreateReceiptDetails < ActiveRecord::Migration
  def change
    create_table :receipt_details do |t|
      t.references :receipt, index: true

      t.timestamps
    end
  end
end
