class Folder < ActiveRecord::Base
	belongs_to :group
	has_many :bookmarks,dependent: :destroy
end
