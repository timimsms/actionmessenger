require 'abstract_controller'
require 'active_support/core_ext/string/inflections'

require 'action_messenger/version'
require 'action_messenger/clients/twilio_client'

# ActionMessenger allows you to send SMS (text-messages) from your application
# using a basic "messenger" model and associated .text.erb view files.
#
# It is heavily modeled after ActionMailer and attempts to provide a reliable
# and extensible core interface for managing text-message notifications.
module ActionMessenger
  # ActionMessenger::Base defines how text messages should be constructed.
  class Base < AbstractController::Base
    abstract!

    class << self
      def message(to:, **opts)
        message_content = opts.fetch(:body, render_content_from_messenger_file)
        client.send_message(to: to, body: message_content, **opts)
      end

      def messenger_name
        name.underscore
      end

      private

      def render_content_from_messenger_file
        'TODO'
      end

      def client
        @client = ActionMessenger::Clients::TwilioClient.new
      end
    end
  end
end
