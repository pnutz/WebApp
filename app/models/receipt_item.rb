class ReceiptItem < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :item_type
  has_and_belongs_to_many :tags
end
