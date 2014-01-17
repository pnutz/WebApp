class Receipt < ActiveRecord::Base
  belongs_to :purchase_type
  belongs_to :folder
  belongs_to :vendor
  belongs_to :currency

  has_many :receipt_items, :dependent => :destroy

  accepts_nested_attributes_for :receipt_items, reject_if: :all_blank, :allow_destroy => true
end
