require 'rails_helper'

RSpec.describe 'Api::V1::Authentications', type: :request do
  describe 'GET /index' do
    it 'get the token' do
      get '/api/v1/authentication/create'
      expect(response).to have_http_status(:success)
    end
  end
end
