class Bookmark < ActiveRecord::Base
	belongs_to :folder
	belongs_to :group
	belongs_to :user
end
