class Group < ActiveRecord::Base
	has_many :folders
	has_many :bookmarks
	has_many :user_groups
	has_many :users, through: :user_groups
	belongs_to :user
end
