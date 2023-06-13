require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get users_path
    end
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct content' do
      get '/users/'
      expect(response.body).to include('Here´s a list of registered users')
    end
    it 'renders the index template' do
      get '/users/'
      expect(response).to render_template(:index)
    end
  end
  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Test User', photo: 'https://picsum.photos/200/300', bio: 'This is an user')
      get user_path(@user)
    end
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end

  it 'renders the correct content' do
    get '/users/show'
    expect(response.body).to include('This is an user')
  end

  it 'renders the show template' do
    get '/users/show'
    expect(response).to render_template(:show)
  end
end
