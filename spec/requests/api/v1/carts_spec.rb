require 'rails_helper'

RSpec.describe "Api::V1::Carts", type: :request do
  describe "GET /show" do
    let(:user) {create(:user, email:"teste@teste")}
    let(:cart) {create(:cart)}
    let(:cart_params) do
      attributes_for(:cart)
    end
    context 'user id exist' do
      it 'return http status ok' do
        get "/api/v1/carts/show/#{user.id}", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'user id is not current user id' do
      it 'return http status unauthorized' do
        get "/api/v1/carts/show/-1", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe " POST /create" do
    let(:user) {create(:user)}
    before do
      create(:category, id:1, name:"Bic")

      create(:brand, id:1, name:"Material")

      create(:product, 
        id:1, 
        name:"Caneta Azul",
        price_in_cents: 100, 
        description: "Caneta Azul Esferógrafica Bic",
        inventory: 50, 
        category_id: 1, 
        brand_id: 1,
      )

      create(:user, 
        id: 2, 
        email: "user@gmail",
        password: "123456",
        credit: 1,
        phone: "987654321")
    end
    cart_params = {
      user_id: 2,
      product_id: 1
    }
    context 'params are ok' do
      it 'return https status created' do
        post "/api/v1/carts/create", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    context 'params are bad' do
      it 'when params is nil' do
        cart_params = nil
        post "/api/v1/carts/create", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
      it 'params is not uniq' do
        post "/api/v1/carts/create", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        post "/api/v1/carts/create", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe " DELETE /delete/:id" do
    let(:user) {create(:user)}
    let(:cart) {create(:cart)}
    context 'cart exist' do
      it 'return https status ok' do
        delete "/api/v1/carts/delete/#{cart.id}", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'cart does not exist' do
      it 'return https status bad_request' do
        delete "/api/v1/carts/delete/-1", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
