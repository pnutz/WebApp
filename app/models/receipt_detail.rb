class ReceiptDetail < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :shipping_address, :class_name => "Address"
  belongs_to :billing_address, :class_name => "Address"
end
