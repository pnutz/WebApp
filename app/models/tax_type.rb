class ItemType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :receipt_taxes
end
