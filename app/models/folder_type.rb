class FolderType < ActiveRecord::Base
	validates :name, presence: true, :uniqueness => { :scope => :user_id }

	belongs_to :user
	has_many :folders
end
