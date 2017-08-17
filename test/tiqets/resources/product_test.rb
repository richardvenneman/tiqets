require 'test_helper'

module Tiqets
  module Resources
    class ProductTest < Minitest::Test
      def setup
        @client = ::Tiqets::Client.new(api_key: 'test_api_key')
      end

      def test_find_product_error
        assert_raises ApiError, "Product '1' was not found" do
          @client.find_product(1)
        end
      end

      def test_find_product
        response = @client.find_product(973698)

        assert_kind_of Hash, response
        assert_equal '973698', response['id']
        assert_equal 'Louvre Museum: Skip The Line', response['title']
      end
    end
  end
end
