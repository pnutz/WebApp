class Folder < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder_type
  belongs_to :folder

  has_many :folders
  has_many :receipts
end
