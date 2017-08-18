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

      assert_equal 'https://api.tiqets.com/v2/',
                   client.instance_variable_get(:@root)

      client = Client.new(root: 'https://test-api.com', api_key: 'test_api_key')

      assert_equal 'https://test-api.com', client.instance_variable_get(:@root)
    end

    def test_connection
      client = Client.new(api_key: 'test_api_key')

      assert_kind_of HTTP::Client, client.connection
    end

    def test_get_error
      client = Client.new(api_key: 'faulty_api_key')

      assert_raises Error do
        client.get('products/1', default_params, 'product')
      end
    end

    def test_get_success
      client = Client.new(api_key: 'test_api_key')
      response = client.get('products/973698', default_params, 'product')

      assert_kind_of Hash, response
      assert_equal '973698', response['id']
      assert_equal 'Louvre Museum: Skip the line', response['title']
    end

    private

    def default_params
      { lang: 'nl', currency: 'EUR' }
    end
  end
end
