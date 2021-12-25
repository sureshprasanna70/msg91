# Msg91  [![Gem Version](https://badge.fury.io/rb/msg91.svg)](https://badge.fury.io/rb/msg91)
This is a wrapper gem to the MSG91 SMS service. You can find more about MSG91
here [msg91.com](https://msg91.com)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'msg91'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install msg91

## Usage

After installation run
 
    $ rails g msg91:install

In your `config/initalizers/msg91.rb`, initialize your `auth_key`. This can be
obtained from [msg91.com](msg91.com)

### Send Message

To send a message

```ruby
message = Msg91::Message.send_text(sender_id,route,text,recepients,country)
```
| params     | type             | description                                                          |
|------------|------------------|----------------------------------------------------------------------|
| sender_id  | string           | It contains sender ID                                                |
| route      | string           | Route name if you have more than one route available in your account |
| text       | string           | It contains the URL encoded message content to send                  |
| recepients | array of strings | It contain mobile numbers without country code                       |
| country    | string           | 0 for international, 91 for India, 1 for USA                         |


### SEND OTP

To send OTP

```ruby
response = Msg91::Otp.send_otp(template_id, mobile)
```

| params       | type             | description                                                          |
|--------------|------------------|----------------------------------------------------------------------|
| template_id  | string           | Id of template for sending OTP. Can be found in MSG91 panel                                     |
| mobile       | string           | Mobile number in international format with country code              |



### VERIFY OTP

To verify the sent OTP

```ruby
response = Msg91::Otp.verify_otp(mobile,optional_params)
```

| params          | type             | description                                                          |
|-----------------|------------------|----------------------------------------------------------------------|
| mobile          | string           | Mobile number in international format with country code              |
| optional_params | hash             | can contain otp and otp_expiry                                       |



### RESEND OTP

To resend the  OTP

```ruby
response = Msg91::Otp.resend_otp(retrytype, mobile,optional_params)
```

| params          | type             | description                                                          |
|-----------------|------------------|----------------------------------------------------------------------|
| retrytype       | string           | Default - Voice, For text it should be text
| mobile          | string           | Mobile number in international format with country code              |
| optional_params | hash             | can contain otp and otp_expiry                                       |



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sureshprasanna70/msg91. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

