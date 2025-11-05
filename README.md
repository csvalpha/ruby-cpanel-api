---------------- WORK IN PROGRESS ---------------
============
Cpanel Ruby Gem 

Ruby interface to connect to the Cpanel API.

This gem provides a comprehensive Ruby interface to interact with the cPanel API, enabling management of email forwarders and email accounts (POP/IMAP).


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

# Configure the gem globally (e.g., in a Rails initializer)
Cpanel.configure do |config|
  config.host = ENV['CPANEL_HOST']
  config.username = ENV['CPANEL_USERNAME']
  config.api_key = ENV['CPANEL_APIKEY']
end

# Instantiate the Client (API key, host, and username can also be passed directly here)
client = Cpanel::Client.new

# --- Email Forwarders ---

# List all forwarders for a domain
forwarders = client.list_forwarders(domain: 'your-domain.com')
puts "Forwarders: #{forwarders}"

# Create a new email forwarder
client.create_forwarder(domain: 'your-domain.com', email: 'info@your-domain.com', forward_to: 'destination@example.com')
puts "Forwarder created."

# Delete an email forwarder
client.delete_forwarder(email: 'info@your-domain.com', forward_to: 'destination@example.com')
puts "Forwarder deleted."

# --- Email Accounts (POP/IMAP) ---

# List all email accounts for a domain
accounts = client.list_accounts(domain: 'your-domain.com')
puts "Accounts: #{accounts}"

# Create a new email account
client.create_account(domain: 'your-domain.com', email: 'user@your-domain.com', password: 'StrongPassword123', quota: 1024) # Quota in MB
puts "Account created."

# Get an email account's quota
quota = client.get_account_quota(domain: 'your-domain.com', email: 'user@your-domain.com')
puts "Account quota: #{quota}"

# Set an email account's quota
client.set_account_quota(domain: 'your-domain.com', email: 'user@your-domain.com', quota: 2048)
puts "Account quota updated."

# Delete an email account
client.delete_account(domain: 'your-domain.com', email: 'user@your-domain.com')
puts "Account deleted."
```

Cpanel has a rate limit system, to handle this you can do
```ruby
require 'cpanel'
client = Cpanel::Client.new

begin
  client.list_forwarders(domain: 'your-domain.com')
rescue Cpanel::RateLimitError => e
  sleep e.wait_seconds
  retry
end


Rails
-----

The library can be initialized with a Rails initializer containing similar:
```ruby
Cpanel.configure do |config|
  config.host = ENV['CPANEL_HOST']
  config.username = ENV['CPANEL_USERNAME']
  config.api_key = ENV['CPANEL_APIKEY']
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

To setup the key information for testing copy `.env.example` to `.env` and fill in the details for `CPANEL_APIKEY`, `CPANEL_HOST`, `CPANEL_USERNAME`, and `CPANEL_DOMAIN`.


Deployment
------

This part is for maintaincers only. In order to deploy this gem to rubygem follow those steps:

1. Bump the version in `lib/cpanel/version.rb`
2. Build the gem using `gem build cpanel.gemspec`
3. Push it to rubygems `gem push cpanel-x.x.x.gem`
