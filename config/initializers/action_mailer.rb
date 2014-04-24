class BlacklisterMailInterceptor
  
  	def self.delivering_email(message)
  		#blacklist general de ese correo o global
  		if Blacklist.where(:email_to => message.to).where('email_from = ? OR global = ?', message.from, true).any?() 
        	message.perform_deliveries = false
    	end
      #para evitar que se manden mails en dev
    	# if Rails.application.config.consider_all_requests_local
    	# 	message.subject = "[#{message.to}] #{message.subject}"
    	# 	message.to = "hello@brainshots.cl"
    	# end
	end
end
ActionMailer::Base.register_interceptor(BlacklisterMailInterceptor)