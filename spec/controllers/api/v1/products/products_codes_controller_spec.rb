require 'rails_helper'

describe Api::V1::Products::ProductsCodesController, type: :request do
  before do
    FactoryBot.create(:product, code: 'MUG', name: 'Reedssy Mug', price: 6)
    FactoryBot.create(:product, code: 'TSHIRT', name: 'Reedssy T-shirt', price: 15)
    FactoryBot.create(:product, code: 'HOODIE', name: 'Reedssy Hoodie', price: 20)
  end

  context "Items: [MUG, TSHIRT, HOODIE]" do
    let(:params) { { 'items': ['MUG', 'TSHIRT','HOODIE'] } }

    it 'returns the total price of products' do
      post "/api/v1/products/codes/price", params: {products_code: params}

      expect(response).to have_http_status(:ok)
      
      resp = JSON.parse(response.body)
      expect(resp['Total']).to eq(41)
    end
  end

  context 'discount price' do
    context "Items: [MUG, TSHIRT, MUG]" do
      let(:params) { { 'items': ['MUG', 'TSHIRT','MUG'] } }

      it 'returns the total price of products' do
        post "/api/v1/products/codes/price", params: {products_code: params}

        expect(response).to have_http_status(:ok)

        resp = JSON.parse(response.body)
        expect(resp['Total']).to eq(21)
      end
    end

    context "Items: [MUG, TSHIRT, TSHIRT, TSHIRT]" do
      let(:params) { { 'items': ['MUG', 'TSHIRT','TSHIRT', 'TSHIRT'] } }

      it 'returns the total price of products' do
        post "/api/v1/products/codes/price", params: {products_code: params}

        expect(response).to have_http_status(:ok)

        resp = JSON.parse(response.body)
        expect(resp['Total']).to eq(37.5)
      end
    end

    context "Items: [MUG, TSHIRT, TSHIRT, TSHIRT, TSHIRT, MUG, HOODIE]" do
      let(:params) { { 'items': ['MUG', 'TSHIRT', 'TSHIRT', 'TSHIRT', 'TSHIRT','MUG', 'HOODIE'] } }

      it 'returns the total price of products' do
        post "/api/v1/products/codes/price", params: {products_code: params}

        expect(response).to have_http_status(:ok)

        resp = JSON.parse(response.body)
        expect(resp['Total']).to eq(68.0)
      end
    end
  end

  context 'non discount price' do
    context "Items: [MUG, TSHIRT, TSHIRT]" do
      let(:params) { { 'items': ['MUG', 'TSHIRT','TSHIRT'] } }

      it 'returns the total price of products' do
        post "/api/v1/products/codes/price", params: {products_code: params}

        expect(response).to have_http_status(:ok)

        resp = JSON.parse(response.body)
        expect(resp['Total']).to eq(36)
      end
    end

    context "Items: [MUG, TSHIRT]" do
      let(:params) { { 'items': ['MUG', 'TSHIRT'] } }

      it 'returns the total price of products' do
        post "/api/v1/products/codes/price", params: {products_code: params}

        expect(response).to have_http_status(:ok)

        resp = JSON.parse(response.body)
        expect(resp['Total']).to eq(21)
      end
    end
  end
end