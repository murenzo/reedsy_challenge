require 'rails_helper'

describe Api::V1::Products::GetProductsController, type: :request do
  context "when products is not empty" do
    it 'returns all products' do
      FactoryBot.create(:product, code: 'MUG', name: 'Reedsy Mug', price: 6.00)
      FactoryBot.create(:product, code: 'TSHIRT', name: 'Reedsy T-shirt', price: 15.00)

      get '/api/v1/products'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  context "when products is empty" do
    it 'returns all products' do
      get '/api/v1/products'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end
  
end
