class Bookmark < ActiveRecord::Base
	belongs_to :folder
	belongs_to :group
	belongs_to :user
	after_save :check_link
	def check_link
		unless self.link[0..3]=="http"
			self.link="http://"+self.link
		end
	end
end
