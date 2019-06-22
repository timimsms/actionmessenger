require 'dotenv/load'
require 'twilio-ruby'

module ActionMessenger
  module Clients
    # Small Ruby class to manage the responsibility of handling the Twilio
    # account credentials and interface with the Twilio SMS client.
    class TwilioClient
      attr_reader :account_sid, :auth_token

      def self.client(**opts)
        new(opts).rest_client
      end

      def initialize(**opts)
        @account_sid = opts.fetch(:account_sid, default_account_sid)
        @auth_token = opts.fetch(:auth_token, default_auth_token)
        @phone_number = opts.fetch(:phone_number, default_phone_number)
      end

      def send_message(to:, body:, **opts)
        account.messages.create(from: opts.fetch(:from, default_phone_number),
                                body: body,
                                to: to)
      end

      def account
        @account ||= rest_client.api.account
      end

      def rest_client
        @rest_client ||= Twilio::REST::Client.new account_sid, auth_token
      end

      private

      def default_phone_number
        ENV.fetch('TWILIO_PHONE_NUMBER')
      end

      def default_account_sid
        ENV.fetch('TWILIO_ACCOUNT_SID')
      end

      def default_auth_token
        ENV.fetch('TWILIO_AUTH_TOKEN')
      end
    end
  end
end
