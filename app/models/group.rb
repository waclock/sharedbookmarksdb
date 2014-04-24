class Group < ActiveRecord::Base
	has_many :folders
	has_many :bookmarks
	has_many :user_groups
end
