module Tiqets
  class Client
    V2_ROOT = 'https://api.tiqets.com/v2'.freeze

    def initialize(root: V2_ROOT, api_key:)
      @root = root
      @api_key = api_key
    end
  end
end
