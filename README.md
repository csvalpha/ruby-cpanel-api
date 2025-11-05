---------------- WORK IN PROGRESS ---------------
============
Cpanel Ruby Gem 

Ruby interface to connect to the Cpanel API.

Currently still work in progress, it only contains the aliases endpoints at the moment.


Installation
------------

```ruby
gem install cpanel
```

Usage
-----
This is how you can use this gem

```ruby
require 'cpanel'

# Instantiate the Client with your API key and domain
client = Cpanel::Client.new 'your-api-key'

# List all the aliases
aliases = client.list_aliases('domain.com')

puts aliases['aliases']
```

Cpanel has a rate limit system, to handle this you can do
```ruby
require 'cpanel'
client = Cpanel::Client.new 'your-api-key'

begin
  client.list_aliases('domain.com')
rescue Cpanel::RateLimitError => e
  sleep e.wait_seconds
  retry
end

```

Rails
-----

The library can be initialized with a Rails initializer containing similar:
```ruby
Cpanel.configure do |config|
  config.api_key = 'your-secret-api-key'
  config.domain = 'your-domain'
end
```


For usage examples on each API endpoint, head over to our official documentation
pages. Or the [Snippets](docs/Snippets.md) file.

Testing
-------

There are different test, they require you to setup an Cpanel account with domain to run.
By default:
```
bundle exec rake spec
```
will run all the tests.

To setup the key information for testing copy `.env.example` to `.env` and fill in the details.


Deployment
------

This part is for maintaincers only. In order to deploy this gem to rubygem follow those steps:

1. Bump the version in `lib/cpanel/version.rb`
2. Build the gem using `gem build cpanel.gemspec`
3. Push it to rubygems `gem push cpanel-x.x.x.gem`
