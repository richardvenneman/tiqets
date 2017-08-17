require 'test_helper'

module Tiqets
  class ErrorTest < Minitest::Test
    def test_authentication_error
      skip 'FIXME: Minitest does not consider the strings as equal'
      client = ::Tiqets::Client.new(api_key: 'faulty_api_key')

      exception = assert_raises ::Tiqets::Error do
        client.find_product(1)
      end

      assert_equal "Tiqets API Error: The server could not verify that you are authorized to access the URL requested.  You either supplied the wrong credentials (e.g. a bad password), or your browser doesn't understand how to supply the credentials required.",
                   exception.message
    end

    def test_find_product_error
      skip 'FIXME: Minitest does not consider the strings as equal'
      client = ::Tiqets::Client.new(api_key: 'test_api_key')

      exception = assert_raises ::Tiqets::Error do
        client.find_product(1)
      end

      assert_equal "Tiqets API Error: product '1' was not found. (code: 404)",
                   exception.message
    end
  end
end
