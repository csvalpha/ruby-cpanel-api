require 'rest_client'
require 'json'

require 'cpanel/client'
require 'cpanel/version'
require 'cpanel/exceptions/exceptions'

# Module for interaction with Cpanel
module Cpanel
  class << self
    attr_accessor :api_key, :host, :username

    def configure
      yield self
      true
    end
  end
end
