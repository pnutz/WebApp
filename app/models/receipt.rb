class Receipt < ActiveRecord::Base
  belongs_to :purchase_type
  belongs_to :folder
  belongs_to :vendor
  belongs_to :currency
  belongs_to :user
  has_and_belongs_to_many :tags

  has_many :receipt_items, :dependent => :destroy
  has_many :documents, :dependent => :destroy

  accepts_nested_attributes_for :receipt_items, :allow_destroy => true
  accepts_nested_attributes_for :documents, :allow_destroy => true
end
