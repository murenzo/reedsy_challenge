module AppServices
  class HoodiePriceService < ApplicationService
    
    CODE = 'HOODIE'
    REGISTERED_RULES = %i().freeze

    def initialize(products_codes, apply_discount = false)
      @count = products_codes.tally[CODE]
      @apply_discount = apply_discount
      @total_price = 0
    end

    def call
      return @total_price if @count.nil?

      calculate_original_cost

      apply_discount if @apply_discount
      
      @total_price
    end

    private

    def calculate_original_cost
      @total_price = fetch_product_price * @count
    end

    def apply_discount
      @total_price += 0
    end

    def fetch_product_price
      @price ||= Product.find_by_code(CODE)&.price
    end
  end
end