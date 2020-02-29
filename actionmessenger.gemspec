
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'action_messenger/version'

Gem::Specification.new do |spec|
  spec.name          = 'actionmessenger'
  spec.version       = ActionMessenger::VERSION
  spec.authors       = ['Tim Walsh']
  spec.email         = ['tim@mims.ms']

  spec.license       = 'MIT'

  spec.summary       = %q{Provides a lightweight interface for sending SMS.}
  spec.description   = %q{Modeled after ActionMailer, implements a similar
                          pattern for short-message-service (SMS) delivery.}
  spec.homepage      = 'https://github.com/timimsms/actionmessenger'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'

    spec.metadata['homepage_uri'] = 'https://github.com/timimsms/actionmessenger'
    spec.metadata['source_code_uri'] = 'https://github.com/timimsms/actionmessenger'
    spec.metadata['changelog_uri'] = 'https://github.com/timimsms/actionmessenger/releases'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'actionpack', '>= 5.0.7.2'
  spec.add_dependency 'activesupport', '>= 5.0.7.2'
  spec.add_dependency 'dotenv-rails', '~> 2.7.2'
  spec.add_dependency 'twilio-ruby', '~> 5.22.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.71.0'
  spec.add_development_dependency 'rubocop-rails', '~> 2.0.1'
  spec.add_development_dependency 'byebug', '~> 11.0.1'
end
