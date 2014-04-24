class PreUser < ActiveRecord::Base

	validates_presence_of :email
	validates_uniqueness_of :email


	def to_s
		return self.email ? self.email : 'No name'
	end

end
