module Tiqets
  module Resources
    module Product
      SLUG = 'products'.freeze

      def find_product(id)
        get("products/#{id}", 'product')
      end
    end
  end
end
