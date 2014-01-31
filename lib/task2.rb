
require 'time'
require 'twilio-ruby'
require 'twilio_credentials'





class Takeaway
	
	include TwilioCredentials
	
	attr_reader :menu

	def initialize(hash)
		@menu = hash
	end

	def place_order(order, total)
		raise "Incorrect total." if @menu.inject(0){|amount, (dish, price)| amount+=price*order[dish]} != total
		
		authorize_Twilio
		@client.account.messages.create(
	  :from => '+441986232027',
	  :to => '+447767674238',
	  :body => "Thank you! Your order was placed and will be delivered before #{(Time.now+60*60).strftime('%R')}")

	end
end

