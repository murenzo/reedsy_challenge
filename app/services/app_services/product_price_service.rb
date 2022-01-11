module AppServices
  class ProductPriceService < ApplicationService
    
    def initialize(products_codes)
      @products_codes = products_codes
    end

    def call
      mug_total_price + tshirt_total_price + hoodie_total_price
    end

    private

    def mug_total_price
      MugPriceService.call(@products_codes)
    end

    def tshirt_total_price
      TshirtPriceService.call(@products_codes)
    end

    def hoodie_total_price
      HoodiePriceService.call(@products_codes)
    end
  end
end
