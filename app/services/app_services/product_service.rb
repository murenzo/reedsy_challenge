module AppServices
  class ProductService
    
    def initialize(products_codes)
      @products_codes = products_codes
    end

    def get_total_price
      fetch_items_prices&.sum
    end

    def fetch_items_prices
      @products_codes.map(&:upcase).map do |product_code|
        Product.find_by_code(product_code)&.price
      end
    end
  end
end