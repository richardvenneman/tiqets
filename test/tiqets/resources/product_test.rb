require 'test_helper'

module Tiqets
  module Resources
    class ProductTest < Minitest::Test
      def setup
        @client = ::Tiqets::Client.new(api_key: 'test_api_key')
      end

      def test_find_product
        product = @client.find_product(973698)

        assert_kind_of ::Tiqets::Resources::Product::Product, product
        assert_equal '973698', product.id
        assert_equal 'Louvre Museum: Skip The Line', product.title
      end
    end
  end
end
