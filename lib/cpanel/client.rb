require 'cpanel/aliases'
require 'cpanel/smtp'
require 'cpanel/response'
require 'cpanel/utils'
require 'cpanel/exceptions/exceptions'

module Cpanel
  class Client
    include Cpanel::Aliases
    include Cpanel::SMTP
    include Cpanel::Utils

    def initialize(api_key = Cpanel.api_key)
      rest_client_params = {
        user: 'api',
        password: api_key,
        user_agent: "cpanel-ruby/#{Cpanel::VERSION}",
        headers: {
          content_type: "application/json"
        }
      }

      @http_client = RestClient::Resource.new('https://api.cpanel.com/v3', rest_client_params)
    end

    def post(resource_path, data, headers = {})
      response = @http_client[resource_path].post(data.to_json, headers)
      Response.new(response)
    rescue StandardError => e
      raise communication_error e
    end

    def get(resource_path, params = nil, accept = '*/*')
      response = @http_client[resource_path].get(params: params, accept: accept)
      Response.new(response)
    rescue StandardError => e
      raise communication_error e
    end

    def put(resource_path, data)
      response = @http_client[resource_path].put(data.to_json)
      Response.new(response)
    rescue StandardError => e
      raise communication_error e
    end

    def delete(resource_path)
      response = @http_client[resource_path].delete
      Response.new(response)
    rescue StandardError => e
      raise communication_error e
    end

    private

    def communication_error(e) # rubocop:disable Metrics/AbcSize
      if e.respond_to? :response
        code = e.response.code

        return BadRequestError.new(e.message, e.response) if code == 400
        return AuthenticationError.new(e.message, e.response) if code == 401
        return NotFoundError.new(e.message, e.response) if code == 404
        return RateLimitError.new(e.message, e.response) if code == 429

        return CommunicationError.new(e.message, e.response)
      end

      CommunicationError.new(e.message)
    end
  end
end
