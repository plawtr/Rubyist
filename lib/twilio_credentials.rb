module TwilioCredentials

	def authorize_Twilio
		# Twilio credentials here
		account_sid = ENV['account_sid']
		auth_token = ENV['auth_token']

		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token
	end	
end