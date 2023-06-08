require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')
  like = Like.create(post_id: post.id, author_id: user.id)

  it 'must update likes_counter' do
    like.update_like_counter
    post.reload
    expect(post.likes_counter).to eq(1)
  end
end
