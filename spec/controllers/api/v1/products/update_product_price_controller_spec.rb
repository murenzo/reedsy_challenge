require 'rails_helper'

describe Api::V1::Products::UpdateProductPriceController, type: :request do
  let(:product) do
    FactoryBot.create(:product, code: 'MUG', name: 'Reedsy Mug', price: 6.00)
  end
  let(:params) { { 'price': 23 } }

  context "when product does not exist" do
    let(:product_id) { product.id + 1 }

    it 'returns a 500 status code with error message' do
      put "/api/v1/products/#{product_id}", params: {update_product_price: params}

      expect(response).to have_http_status(:internal_server_error)
      
      resp = JSON.parse(response.body)
      expect(resp['message']).to eq("Couldn't find Product with 'id'=#{product_id}")
    end
  end
  
  context 'when product exists' do
    context 'when params has valid price value' do
      it 'returns a 200 status code with updated object' do
        put "/api/v1/products/#{product.id}", params: {update_product_price: params}
  
        expect(response).to have_http_status(:ok)
        
        resp = JSON.parse(response.body)

        expect(resp['price']).to eq("23.0")
      end
    end

    context 'when price params is missing' do
      let(:params) { nil }

      it 'returns a 500 status code with error messages' do
        put "/api/v1/products/#{product.id}", params: {update_product_price: params}
  
        expect(response).to have_http_status(:internal_server_error)
        
        resp = JSON.parse(response.body)
        expect(resp['message']).to start_with('param is missing')
      end
    end

    context 'when price params is invalid' do
      let(:params) { { 'price': 100.0 } }

      it 'returns a 400 status code with error messages' do
        put "/api/v1/products/#{product.id}", params: {update_product_price: params}
  
        expect(response).to have_http_status(:bad_request)
        
        resp = JSON.parse(response.body)
        expect(resp['message']['price']).to match_array(["must be less than 100.0", 'is invalid'])
      end
    end
  end
end