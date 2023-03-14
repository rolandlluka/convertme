# Convertme

This is a Ruby gem that can convert between different currencies using real-time exchange rates from the Open Exchange Rates API. The gem provides a simple interface for converting between currencies and supports over 170 different currencies.
## Installation

You can install the Currency Converter gem using RubyGems:

Install the gem and add to the application's Gemfile by executing:

    $ bundle add convertme-0.1.0.gem

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install convertme-0.1.0.gem

## Usage

To use the gem, you'll need to sign up for a free API key from Open Exchange Rates. Once you have your API key, you can set it in your application like this:
To convert between currencies, you can use the convert method:

    Convertme::CurrencyConverter.new("EUR", "CHF").run(100) 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/convertme. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/convertme/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Convertme project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/convertme/blob/main/CODE_OF_CONDUCT.md).
