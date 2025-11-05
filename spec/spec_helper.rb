require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'

  minimum_coverage 85
end

require 'cpanel_email'
RSpec.configure(&:raise_errors_for_deprecations!)

require 'dotenv'
Dotenv.load

APIKEY = ENV['CPANEL_APIKEY']
HOST = ENV['CPANEL_HOST']
USERNAME = ENV['CPANEL_USERNAME']
DOMAIN = ENV['CPANEL_DOMAIN']
APIKEY = ENV['CPANEL_APIKEY']
DOMAIN = ENV['CPANEL_DOMAIN']

# require 'vcr'
# VCR.configure do |c|
#   c.cassette_library_dir = 'vcr_cassettes'
#   c.hook_into :webmock
#   c.default_cassette_options = { record: :new_episodes }
#   c.filter_sensitive_data('<APIKEY>') { APIKEY }
#   c.filter_sensitive_data('<DOMAIN>') { DOMAIN }
#   c.filter_sensitive_data('<AUTH HEADER>') { Base64.encode64("api:#{APIKEY}").chomp }
#
#   c.configure_rspec_metadata!
# end
