class Bookmark < ActiveRecord::Base
	belongs_to :folder
	belongs_to :group
	belongs_to :user
	before_save :check_link
	def check_link
		unless self.link[0..3]=="http" || self.link.include?("chrome-extension://" )
			self.link="http://"+self.link
		end
	end
end
