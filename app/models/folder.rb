class Folder < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder_type
  belongs_to :folder
end
