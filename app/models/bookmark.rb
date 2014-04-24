class Bookmark < ActiveRecord::Base
	belongs_to :folder
	belongs_to :group
end
