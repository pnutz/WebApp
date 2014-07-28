class Tag < ActiveRecord::Base
  has_and_belongs_to_many :receipts
  has_and_belongs_to_many :receipt_items
end
