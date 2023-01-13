require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /index" do
    let(:user) {create(:user, is_admin: true)}
    before do
      create(:user, 
        id:1, 
        name: "user", 
        email: "user@gmail",
        password: "123456",
        is_admin: false,
        credit: 0,
        phone: "123456789"
        )
    end
    context 'when index' do
      before do
        get '/api/v1/users/index', headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
      it 'return a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
      it 'return created instances' do
        expect(JSON.parse(response.body).first).to include(
          'name',
          'credit',
          'profile_picture_url',
          'is_admin'
        )
      end
    end
  end

  describe " GET /show" do
    let(:user) {create(:user)}
    context 'id exist' do
      before do
        get "/api/v1/users/show/#{user.id}", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
    end
    context 'id not found' do
      before do
        get "/api/v1/users/show/-1", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
      end
      it 'return https not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe " POST /create" do
    let(:user_params) {attributes_for(:user)}
    context 'params are ok' do
      it 'return https status created' do
        post "/api/v1/users/create", params: {user: user_params}
        expect(response).to have_http_status(:created)
      end
    end
    context 'params are bad' do
      it 'when params is nil' do
        user_params = {
          name: nil
        }
        post "/api/v1/users/create", params: {user: user_params}
        expect(response).to have_http_status(:unprocessable_entity)
      end
      it 'params is not uniq' do
        post "/api/v1/users/create", params: {user: user_params}
        post "/api/v1/users/create", params: {user: user_params}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe " PATCH /update/:id" do
    let(:user) {create(:user)}
    let(:user5) {create(:user, name: "user5", phone: "123456789")}
    let(:user6) {create(:user, name: "user6", phone: "987654321")}
    context 'params are ok' do
      it 'return https status ok' do
        patch "/api/v1/users/update/#{user5.id}", params: {user: {name: "user_teste"}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'params are nil' do
      it 'return https status unprocessable_entity' do
        patch "/api/v1/users/update/#{user5.id}", params: {user: {name: nil}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe " PATCH /update_password/:id" do
    let(:user) {create(:user, password: "123456")}
    context 'params are ok' do
      it 'return https status ok' do
        patch "/api/v1/users/update_password/#{user.id}", params: {user: {password: "123456", 
          password_confirmation: "123456"}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'password is not equal password_confirmation' do
      it 'return https status unprocessable_entity' do
        patch "/api/v1/users/update_password/#{user.id}", params: {user: {password: "123456", 
          password_confirmation: "1234567"}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe " DELETE /delete/:id" do
    let(:user) {create(:user)}
    context 'user exist' do
      it 'return https status ok' do
        delete "/api/v1/users/delete/#{user.id}", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'user does not exist' do
      it 'return https status bad_request' do
        delete "/api/v1/users/delete/-1", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  
  describe "user login" do
    before do
      create(:user, email: 'teste@teste', password:'123456')
    end
    context "when user has no valid email" do
      it " return http status unauthorized" do
        post '/api/v1/users/login', params: {
          email: 'teste@test',
          password: '123456'
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context "when user has no valid password" do
      it " return http status unauthorized" do
        post '/api/v1/users/login', params: {
          email: 'teste@teste',
          password: '12345689'
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "user logout" do
    let(:user) {create(:user)}
    before do
      post '/api/v1/users/login', params: {
        email: 'trainee@struct',
        password: '123456'
      }
    end
    context "when user is loged" do
      it "return http status ok" do
        get '/api/v1/users/logout', headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
