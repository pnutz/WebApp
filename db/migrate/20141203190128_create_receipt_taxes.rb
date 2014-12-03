class CreateReceiptTaxes < ActiveRecord::Migration
  def change
    create_table :receipt_taxes do |t|
      t.references :receipt, index: true
      t.references :tax_type, index: true
      t.decimal :cost, :decimal, precision: 19, scale: 4

      t.timestamps
    end
  end
end
