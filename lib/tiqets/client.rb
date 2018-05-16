require 'addressable/uri'

require 'tiqets/resources/product'

module Tiqets
  class Client
    include Resources::Product

    V2_ROOT = 'https://api.tiqets.com/v2/'.freeze

    def initialize(root: V2_ROOT, api_key:)
      @root = root
      @api_key = api_key
    end

    def connection
      @connection ||= HTTP.auth("Token #{@api_key}")
    end

    def get(url, params, response_key)
      response = connection.get(@root + url, params: params)

      handle_response(response, response_key)
    end

    def handle_response(response, response_key)
      response = JSON.parse(response)
      return response[response_key] if response['success'] == true

      raise Error.new(response['status'], response['message'])
    rescue JSON::ParserError
      raise Error.new(404, 'Not Found')
    end
  end
end
