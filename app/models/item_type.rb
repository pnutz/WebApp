class ItemType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :receipt_items
end
