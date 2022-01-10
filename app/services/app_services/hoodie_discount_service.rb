module AppServices
  class HoodieDiscountService
    
    CODE = 'HOODIE'
    REGISTERED_RULES = %i().freeze

    def initialize(products_codes, apply_discount = false)
      @count = products_codes.tally[CODE]
      @apply_discount = apply_discount
    end

    def calculate_price
      return 0 if @count.nil?

      total_price

      apply_discount if @apply_discount

      @total_price
    end

    private

    def total_price
      @total_price = fetch_product_price * @count
    end

    def apply_discount
      0
    end

    def is_qualified?(rule)
      nil
    end

    def fetch_product_price
      @price ||= Product.find_by_code(CODE)&.price
    end
  end
end