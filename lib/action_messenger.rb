require 'abstract_controller'
require 'active_support/core_ext/string/inflections'

require 'action_messenger/version'
require 'action_messenger/params'
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

    class_attribute :default_params, default: ActionMessenger::Params.defaults

    class << self
      def default(value = nil)
        self.default_params = current_params.merge(value).freeze if value
        default_params
      end
      alias default_options= default

      def message(to:, **opts)
        message_content = opts.fetch(:body, text_message_content_from_erb)
        message_sender = opts.fetch(:from, text_message_default_sender)
        client.send_message(to: to, body: message_content, from: message_sender)
      end

      def messenger_name
        name.underscore
      end

      def current_params
        default_params || ActionMessenger::Params.defaults
      end

      private

      # Will attempt to render content for the text message from the
      # corresponding app/views/messengers/**.text.erb file.
      def text_message_content_from_erb
        'TODO'
      end

      # Can be set at the top of classes which inherit from this model
      # using the following Syntax:
      #
      # class TestMessenger < ActionMessenger::Base
      #   default from: "+15551234567"
      # end
      #
      def text_message_default_sender
        current_params.fetch(:from)
      end

      def client
        @client = ActionMessenger::Clients::TwilioClient.new
      end
    end
  end
end
