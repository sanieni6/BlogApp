require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')
  comment = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!')

  it 'must update comments_counter' do
    comment.update_comment_counter
    post.reload
    expect(post.comments_counter).to eq(1)
  end
end
