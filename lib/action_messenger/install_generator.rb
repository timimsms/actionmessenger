require 'rails/generators'

module ActionMessenger
  # Enables the ability to generate new Messenger instances which will be used
  # to send messages.
  class InstallGenerator < Rails::Generators::Base
    desc 'Used to generate a new ActionMessenger implementation.'

    # NOTE: Should evaluate adding a --with-template flag to enable generation
    #       of a .text.erb file which can be used as opposed to standard in-line
    #       content. - TW 11/18/2019
    ##
    # # Commandline options can be defined here using Thor-like options:
    # class_option :my_opt, type: :boolean, default: false, desc: "My Option"
    #
    # # I can later access that option using:
    # # options[:my_opt]

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def copy_initializer_file
      Dir.mkdir messenger_directory unless File.directory?(messenger_directory)
      copy_file 'messenger.rb', "#{messenger_directory}/#{file_name}.rb"
    end

    private

    def messenger_directory
      'app/messengers'
    end
  end
end
