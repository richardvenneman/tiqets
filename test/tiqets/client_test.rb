require 'test_helper'

module Tiqets
  class ClientTest < Minitest::Test
    def test_requires_api_key
      assert_raises ArgumentError do
        Client.new
      end

      assert_kind_of Client, Client.new(api_key: 'test_api_key')
    end
  end
end
