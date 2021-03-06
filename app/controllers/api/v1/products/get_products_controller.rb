# frozen_string_literal: true

module Api
  module V1
    module Products
      class GetProductsController < ApplicationController
        def index
          @products = Product.all

          json_render @products
        end
      end
    end
  end
end