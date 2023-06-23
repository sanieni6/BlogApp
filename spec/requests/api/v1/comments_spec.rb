require 'rails_helper'

RSpec.describe 'Api::V1::Comments', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/comments/index'
      expect(response).to have_http_status(:success)
    end
    it 'returns created comment' do
      post '/api/v1/comments/create', params: { comment: { body: 'test comment', user_id: 1, post_id: 1 } }
      expect(response).to have_http_status(:success)
    end

  end
end
