require 'http'

require 'tiqets/version'
require 'tiqets/client'
require 'tiqets/error'

module Tiqets
  def self.default_api
    @default_api ||= Client.new(api_key: ENV.fetch('TIQETS_API_KEY'))
  end
end
