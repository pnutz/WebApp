class ReceiptItem < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :item_tax
end
