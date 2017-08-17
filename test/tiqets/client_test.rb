require 'test_helper'

module Tiqets
  class ClientTest < Minitest::Test
    def test_requires_api_key
      assert_raises ArgumentError do
        Client.new
      end

      assert_kind_of Client, Client.new(api_key: 'test_api_key')
    end

    def test_root
      client = Client.new(api_key: 'test_api_key')

      assert_equal 'https://api.tiqets.com/v2',
                   client.instance_variable_get(:@root)

      client = Client.new(root: 'https://test-api.com', api_key: 'test_api_key')

      assert_equal 'https://test-api.com', client.instance_variable_get(:@root)
    end

    def test_connection
      client = Client.new(api_key: 'test_api_key')

      assert_kind_of HTTP::Client, client.connection
    end
  end
end
