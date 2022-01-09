# frozen_string_literal: true

module Api
  module V1
    module Products
      class ProductsCodesController < ApplicationController
        def price_check
          product_service = ::AppServices::ProductService.new(product_params["items"])

          json_render Items: product_params["items"], Total: product_service.get_total_price
        end

        private

        def product_params
          params.require(:products_code).permit(:items => [])
        end
      end
    end
  end
end