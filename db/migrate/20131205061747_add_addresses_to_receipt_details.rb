class AddAddressesToReceiptDetails < ActiveRecord::Migration
  def change
    add_reference :receipt_details, :shipping_address, index: true
    add_reference :receipt_details, :billing_address, index: true
  end
end
