# frozen_string_literal: true

module Api
  module V1
    module Products
      class UpdateProductPriceController < ApplicationController
        def update
          @product = Product.find(params[:id])

          @product.update!(product_params)

          json_render @product
        end

        private

        def product_params
          params.require(:update_product_price).permit(:price)
        end
      end
    end
  end
end