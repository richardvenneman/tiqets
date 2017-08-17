require 'http'

require 'tiqets/version'
require 'tiqets/client'

module Tiqets
  def self.default_api
    @default_api ||= Client.new(api_key: ENV.fetch('TIQETS_API_KEY'))
  end
end
