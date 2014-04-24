class ApiKey < ActiveRecord::Base

	belongs_to :user

	before_create :generate_access_token

	def generate_access_token
	  begin
	    self.access_token = SecureRandom.hex
	  end while self.class.exists?(access_token: access_token)
	  begin
	    self.public_key = SecureRandom.hex
	  end while self.class.exists?(public_key: public_key)
	end

end
