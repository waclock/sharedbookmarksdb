class Token < ActiveRecord::Base

	belongs_to :user

	before_create :generate
	def generate
		begin
			key = SecureRandom.hex
			key = key[(key.length/2)..(key.length-1)]
			key = key.gsub("/","").gsub(".","")
			self.value = key
		end while self.class.exists?(:value => key)
	end

end
