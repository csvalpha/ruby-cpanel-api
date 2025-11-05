require 'rest_client'
require 'json'

require 'cpanel_email/client'
require 'cpanel_email/version'
require 'cpanel_email/exceptions/exceptions'

# Module for interaction with CpanelEmail
module CpanelEmail
  class << self
    attr_accessor :api_key, :host, :username

    def configure
      yield self
      true
    end
  end
end
