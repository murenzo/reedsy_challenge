require 'rails_helper'

describe Api::V1::Products::ProductsCodesController, type: :request do
  before do
    FactoryBot.create(:product, code: 'MUG', name: 'Reedssy Mug', price: 6.00)
    FactoryBot.create(:product, code: 'TSHIRT', name: 'Reedssy T-shirt', price: 15.00)
    FactoryBot.create(:product, code: 'HOODIE', name: 'Reedssy Hoodie', price: 20.00)
  end

  context "Items: [MUG, TSHIRT, HOODIE]" do
    let(:params) { { 'items': ['MUG', 'TSHIRT','HOODIE'] } }

    it 'returns a total of 41.0' do
      post "/api/v1/products/codes/price", params: {products_code: params}

      expect(response).to have_http_status(:ok)
      
      resp = JSON.parse(response.body)
      expect(resp['Total']).to eq('41.0')
    end
  end

  context "Items: [MUG, TSHIRT, MUG]" do
    let(:params) { { 'items': ['MUG', 'TSHIRT','MUG'] } }

    it 'returns a total of 27.0' do
      post "/api/v1/products/codes/price", params: {products_code: params}

      expect(response).to have_http_status(:ok)
      
      resp = JSON.parse(response.body)
      expect(resp['Total']).to eq('27.0')
    end
  end

  context "Items: [MUG, TSHIRT, MUG, MUG]" do
    let(:params) { { 'items': ['MUG', 'TSHIRT','MUG', 'MUG'] } }

    it 'returns a total of 33.0' do
      post "/api/v1/products/codes/price", params: {products_code: params}

      expect(response).to have_http_status(:ok)
      
      resp = JSON.parse(response.body)
      expect(resp['Total']).to eq('33.0')
    end
  end

  context "Items: [MUG, TSHIRT, TSHIRT, TSHIRT, TSHIRT, MUG, HOODIE]" do
    let(:params) { { 'items': ['MUG', 'TSHIRT', 'TSHIRT', 'TSHIRT', 'TSHIRT','MUG', 'HOODIE'] } }

    it 'returns a total of 92.0' do
      post "/api/v1/products/codes/price", params: {products_code: params}

      expect(response).to have_http_status(:ok)
      
      resp = JSON.parse(response.body)
      expect(resp['Total']).to eq('92.0')
    end
  end
end