require 'bundler/setup'
require 'time'
require 'twilio-ruby'



class Takeaway
	
	attr_reader :menu, :twilio_client

	def initialize(hash)
		@menu = hash

		# set up a client to talk to the Twilio REST API
		@twilio_client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']

	end

	def place_order(order, total)
		raise "Incorrect total." if @menu.inject(0){|amount, (dish, price)| amount+=price*order[dish]} != total
		
		@twilio_client.account.messages.create(
	  :from => '+441986232027',
	  :to => '+447767674238',
	  :body => "Thank you! Your order was placed and will be delivered before #{(Time.now+60*60).strftime('%R')}")
	end

	def to_s	
		"Menu".center(40)+"\n" + @menu.inject(""){|c, (dish, price)| c << dish.to_s.capitalize.ljust(34, '.')+("£"+ "%.2f" % price.to_s).rjust(6,'.')+"\n"}
	end
end

