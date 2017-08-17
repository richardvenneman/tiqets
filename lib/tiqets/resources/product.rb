module Tiqets
  module Resources
    module Product
      SLUG = 'products'.freeze

      def find_product(id)
        response = get("products/#{id}", 'product')
        Product.new(response)
      end

      class Product
        attr_reader :id, :language, :languages, :title, :tagline, :price,
                    :sale_status, :country_name, :country_id, :city_name,
                    :city_id, :tag_ids, :images, :ratings, :geolocation,
                    :distance, :venue, :product_url, :product_checkout_url

        def initialize(attributes)
          @id = attributes['id']
          @language = attributes['language']
          @languages = attributes['languages']
          @title = attributes['title']
          @tagline = attributes['tagline']
          @price = attributes['price']
          @sale_status = attributes['sale_status']
          @country_name = attributes['country_name']
          @country_id = attributes['country_id']
          @city_name = attributes['city_name']
          @city_id = attributes['city_id']
          @tag_ids = attributes['tag_ids']
          @images = attributes['images']
          @ratings = attributes['ratings']
          @geolocation = attributes['geolocation']
          @distance = attributes['distance']
          @venue = attributes['venue']
          @product_url = attributes['product_url']
          @product_checkout_url = attributes['product_checkout_url']
        end
      end
    end
  end
end
