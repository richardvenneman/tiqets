require 'test_helper'

module Tiqets
  class ErrorTest < Minitest::Test
    def test_authentication_error
      client = ::Tiqets::Client.new(api_key: 'faulty_api_key')

      exception = assert_raises ::Tiqets::Error do
        client.find_product(1, lang: 'nl', currency: 'EUR')
      end

      assert_equal "Tiqets API error: The server could not verify that you are authorized to access the URL requested.  You either supplied the wrong credentials (e.g. a bad password), or your browser doesn't understand how to supply the credentials required.",
                   exception.message
    end

    def test_find_product_error
      client = ::Tiqets::Client.new(api_key: 'test_api_key')

      exception = assert_raises ::Tiqets::Error do
        client.find_product(1, lang: 'nl', currency: 'EUR')
      end

      assert_equal 404, exception.code
      assert_equal "Tiqets API error: product '1' was not found.",
                   exception.message
    end
  end
end
