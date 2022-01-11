module AppServices
  class TshirtPriceService < ApplicationService
    
    CODE = 'TSHIRT'
    REGISTERED_RULES = %i(buy_three_or_more_rule).freeze

    def initialize(products_codes, apply_discount = true)
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
      REGISTERED_RULES.each do |reg_rule|

        if self.respond_to?(reg_rule, true)
          rule = self.send(reg_rule)

          if is_qualified?(rule)
            @total_price -= (@total_price *= rule[:discount_value])
          end
        end
      end
    end

    def is_qualified?(rule)
      rule[:enabled] && @count >= rule[:minimum_qty]  && rule[:discount_type] == :percentage
    end

    def buy_three_or_more_rule
      {
        enabled: true,
        discount_type: :percentage,
        minimum_qty: 3,
        discount_value: 0.3
      }
    end

    def fetch_product_price
      @price ||= Product.find_by_code(CODE)&.price
    end
  end
end