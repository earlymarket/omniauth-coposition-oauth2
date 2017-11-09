# Omniauth::Coposition::Oauth2

This gem allows you to quickly and easily integrate the Coposition into your website, allowing your users to authorize your application to access their Coposition data. Follow the Installation and Usage guide to get started.

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

When developer wants to use Coposition as an omniauth provider, he should go through following steps:

1. Register developer account on Coposition (https://coposition.com). Corresponding oauth application will be created automatically.

2. Add this gem as a dependency to third party application.

3. Within new initializer (Rails project initializer, name does not matter) add new omniauth provider with following settings:

```
provider :coposition_oauth2,
  ENV["COPOSITION_CLIENT_ID"],
  ENV["COPOSITION_CLIENT_SECRET"],
```
We recommend using env vars here for security reasons.

4. Values for COPOSITION_CLIENT_ID and COPOSITION_CLIENT_SECRET should be copied from oauth application details on Coposition side (go to /oauth/applications/:application_id and copy values from this page).

5. Add callback route to your application. It will triggered by oauth server after successfull authentication from third party app side. For example:
```
get "/auth/:provider/callback", to: "sessions#create"
```

6. Finally, add link inviting to sign via Coposition (`omniauth_coposition_path` helper) into application pages. It could look like this (with slim templates):
```
= button_to(omniauth_coposition_path, class: "bonus__sign-in btn green") do
  | Sign in with Coposition
```
But it means you'll have to add helper like this:
```
def omniauth_coposition_path
  path_params = { path: "/auth/coposition_oauth2" }

  URI::HTTP.build(path_params).request_uri
end
```
Or you can use "/auth/coposition_oauth2" directly.
Please, not that included redirect_uri should match the one you previously added as a oauth application param. This should be valid url which means that 'localhost' won't work and should be replaced with 'lvh.me' or something like that.

7. For Rails apps hash with authentication data is returned to callback route within `request.env["omniauth.auth"]`
Within a strategy we define what data will be included using following blocks:
```
info do
  raw_info.merge("token" => access_token.token)
end
```
and
```
uid { raw_info["id"] }
```
And 3rd party application can extract this data calling corresponding methods (like `info` and `uid`) on received authentication hash.

#### REVOKE

To revoke an existing access token, post to https://coposition.com/oauth/revoke with a body containing a hash of your client_id, client_secret and the acess token.
```
{ 'client_id': CLIENT_UID, 'client_secret': CLIENT_SECRET, 'token': ACCESS_TOKEN }
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-coposition-oauth2.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
