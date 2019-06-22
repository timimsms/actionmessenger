# ActionMessenger

ActionMessenger provides a lightweight comparative solution for texting as [ActionMailer](https://github.com/rails/rails/tree/master/actionmailer) provides for email composition and delivery in the core Rails API.

## Installation

### Ruby

Add this line to your application's Gemfile:

```ruby
gem 'actionmessenger'
```

And then execute:

```
bundle
```

Or install it yourself as:

```
gem install actionmessenger
```

### Rails


The latest version of Action Messenger can be installed with RubyGems:

> https://rubygems.org/gems/actionmessenger

Simply add the following to your Gemfile:

```ruby
gem 'actionmessenger'
```

And then run `bundle install` in your project's root directory directory.


## Usage

### Sending Text Messages

```ruby
require 'action_messenger'

class TestMessenger < ActionMessenger::Base
  default from: ENV['TWILIO_PHONE_NUMBER']

  def self.send_test(to:)
    message(to: to, body: 'TEST')
  end
end
```

TODO: Update this second once we are pulling in the text from `app/views`. - TW


### Generating new Messengers


> TODO: Fill out this section once we have basic generators.


### Setting Defaults

Similar to ActionMailer, the _Base_ class maintains a class-level attribute
which stores default values used in the message delivery configuration.

For a new _Messenger_ instance, a default value could be provided using the following syntax:

```ruby
class TommyTutoneMessenger < ActionMessenger::Base
  default from: '+15558675309'
  .....
end
```

### Application Configuration


> TODO: Look to review how defaults would be set in a new Rails app. - TW


## Development

After checking out the repository, you may:

- run `bin/setup` to install dependencies,
- run `bundle exec rspec spec` to run the tests, and
- run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/timimsms/actionmessenger.

## License

ActionMessenger is provided as open source software under the [MIT license](https://opensource.org/licenses/MIT).
