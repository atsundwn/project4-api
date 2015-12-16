#
require 'twilio-ruby'

class MessagesController < OpenReadController

  # put your own credentials here
  account_sid = 'AC7852ed79b6eea977877aea0e5adc2a9e'
  auth_token = ENV["AUTH_TOKEN"]

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

end
