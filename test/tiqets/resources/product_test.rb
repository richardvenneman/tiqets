require 'test_helper'

module Tiqets
  module Resources
    class ProductTest < Minitest::Test
      def setup
        @client = ::Tiqets::Client.new(api_key: 'test_api_key')
      end

      def test_find_product
        product = @client.find_product(973698, lang: 'nl', currency: 'EUR')

        assert_kind_of ::Tiqets::Resources::Product::Product, product
        assert_equal '973698', product.id
        assert_equal 'Louvre Museum: Skip the line', product.title
      end

      def test_find_erroneous_product
        exception = assert_raises ::Tiqets::Error do
          @client.find_product(1, lang: 'nl', currency: 'EUR')
        end

        assert_equal 404, exception.code
        assert_equal "Tiqets API error: product '1' was not found.",
                     exception.message
      end
    end
  end
end
