class ReceiptTax < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :tax_type
end
