class Receipt < ActiveRecord::Base
  belongs_to :receipt_category
  belongs_to :folder
  belongs_to :vendor
  belongs_to :currency
  belongs_to :user
  belongs_to :profile
  has_and_belongs_to_many :tags

  has_many :receipt_items, :dependent => :destroy
  has_many :receipt_taxes, :dependent => :destroy
  has_many :documents, :dependent => :destroy

  accepts_nested_attributes_for :receipt_items, :allow_destroy => true
  accepts_nested_attributes_for :receipt_taxes, :allow_destroy => true
  accepts_nested_attributes_for :documents, :allow_destroy => true
end