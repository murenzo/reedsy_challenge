module AppServices
  class ProductService
    
    def initialize(products_codes)
      @products_codes = products_codes
    end

    def get_total_price
      mug_total_price + tshirt_total_price + hoodie_total_price
    end

    private

    def mug_total_price
      MugDiscountService.new(@products_codes).calculate_price
    end

    def tshirt_total_price
      TshirtDiscountService.new(@products_codes).calculate_price
    end

    def hoodie_total_price
      HoodieDiscountService.new(@products_codes).calculate_price
    end
  end
end
