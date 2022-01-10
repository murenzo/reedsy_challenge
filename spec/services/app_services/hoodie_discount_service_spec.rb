# frozen_literal: true

require 'rails_helper'

describe  AppServices::HoodieDiscountService do
  let!(:subject) { AppServices::HoodieDiscountService }

  before do
    FactoryBot.create(:product, code: 'MUG', name: 'Reedssy Mug', price: 6)
    FactoryBot.create(:product, code: 'TSHIRT', name: 'Reedssy T-shirt', price: 15)
    FactoryBot.create(:product, code: 'HOODIE', name: 'Reedssy Hoodie', price: 20)
  end

  context 'when apply_discount is set to false' do
    it 'returns the total value for all product items sent without discount' do
      product_codes = ['HOODIE', 'HOODIE']
      expect(subject.new(product_codes, false).calculate_price).to eq(40)
    end
  end

  context 'when apply_discount is set to true' do
    context 'and got no product item passed in the Array' do
      it 'returns the zero as the value' do
        product_codes = []
        expect(subject.new(product_codes, true).calculate_price).to eq(0)
      end
    end

    context 'and got product items' do
      it 'returns the total value without discount applied' do
        product_codes = ['HOODIE']
        expect(subject.new(product_codes, true).calculate_price).to eq(20)
      end
    end
  end
end