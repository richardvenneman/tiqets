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
      @connection ||= HTTP.auth("Authorization: Token #{@api_key}")
    end

    def get(url, response_key)
      response = connection.get(@root + url)

      handle_response(response, response_key)
    end

    def handle_response(response, response_key)
      response = JSON.parse(response)
      raise ApiError, response['message'] if response['success'] == false

      response[response_key]
    end
  end
end
