# Omniauth::Coposition::Oauth2

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/omniauth/coposition/oauth2`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-coposition-oauth2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-coposition-oauth2

## Usage

BUILD

When building a new gem version, make sure that PROVIDER_URL corresponds to your current oauth server address. Also make sure all other strategy options are tuned up properly.

RELEASE

When developer wants to use Coposition as an omniauth provider, he should go through following steps:
1. Register developer account on Coposition (https://coposition.com). Corresponding oauth application will be created automatically.
2. Add this gem as a dependency to third party application.
3. Within new initializer add new omniauth provider with following settings:

```
provider :coposition_oauth2,
  ENV["COPOSITION_CLIENT_ID"],
  ENV["COPOSITION_CLIENT_SECRET"],
```
We recommend using env vars here for security reasons.
4. Values for COPOSITION_CLIENT_ID and COPOSITION_CLIENT_SECRET should be copied from oauth application details on Coposition side.
5. Add link inviting to sign via Coposition (`omniauth_coposition_path` helper) into application pages.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-coposition-oauth2.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

