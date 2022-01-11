# frozen_literal: true

require 'rails_helper'

describe  AppServices::TshirtPriceService do
  let!(:subject) { AppServices::TshirtPriceService }

  before do
    FactoryBot.create(:product, code: 'MUG', name: 'Reedssy Mug', price: 6)
    FactoryBot.create(:product, code: 'TSHIRT', name: 'Reedssy T-shirt', price: 15)
    FactoryBot.create(:product, code: 'HOODIE', name: 'Reedssy Hoodie', price: 20)
  end

  context 'when apply_discount is set to false' do
    it 'returns the total value for all product items sent without discount' do
      product_codes = ['TSHIRT', 'TSHIRT', 'TSHIRT']
      expect(subject.call(product_codes, false)).to eq(45)
    end
  end

  context 'when apply_discount is set to true' do
    context 'and got no product item passed in the Array' do
      it 'returns the zero as the value' do
        product_codes = []
        expect(subject.call(product_codes, true)).to eq(0)
      end
    end

    context 'and got product items that does not meet the discount requirement' do
      it 'returns the total value without discount applied' do
        product_codes = ['TSHIRT', 'TSHIRT']
        expect(subject.call(product_codes, true)).to eq(30)
      end
    end

    context 'and got product items that does meet the minimum discount requirement' do
      it 'returns the total value minus the discounted amount' do
        product_codes = ['TSHIRT', 'TSHIRT', 'TSHIRT']
        expect(subject.call(product_codes, true)).to eq(31.5)
      end
    end

    context 'and got product items that is greater than the minimum discount requirement' do
      it 'returns the total value minus the discounted amount' do
        product_codes = ['TSHIRT', 'TSHIRT', 'TSHIRT', 'TSHIRT', 'TSHIRT']
        expect(subject.call(product_codes, true)).to eq(52.5)
      end
    end
  end
end