require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Test User', photo: 'https://picsum.photos/200/300', bio: 'This is an user')
      get user_posts_path(@user)
    end

    it 'returns http success' do
      get '/users/show/posts/index'
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct content' do
      get '/users/show/posts/'
      expect(response.body).to include('This is a list of posts')
    end
    it 'renders the index template' do
      get '/users/show/posts/'
      expect(response).to render_template(:index)
    end
  end
  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Test User', photo: 'https://picsum.photos/200/300', bio: 'This is an user')
      @post = Post.create(author_id: @user.id, title: 'Test Post', text: 'This is a post')
      get user_post_path(@user, @post)
    end

    it 'returns http success' do
      get '/users/show/posts/show'
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct content' do
      get '/users/show/posts/show'
      expect(response.body).to include('This is a post')
    end
    it 'renders the show template' do
      get '/users/show/posts/show'
      expect(response).to render_template(:show)
    end
  end
end
