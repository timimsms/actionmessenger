require 'action_messenger'

class Messenger < ActionMessenger::Base
  default from: ENV['TWILIO_PHONE_NUMBER']

  def self.send_test(to:)
    message(to: to, body: 'TEST')
  end
end
