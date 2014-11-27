class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :receipts
  has_many :folders
end
