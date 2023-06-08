require 'rails_helper'

RSpec.describe Post, type: :model do
  subject = Post.create(title: 'Hello', text: 'This is my first post')

  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')
  Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!')

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid with a title exceeding 250 characters' do
    string = 'luis' * 70
    sample = Post.create(author_id: user.id, title: string, text: 'This is my first post')
    expect(sample).to be_invalid
    expect(sample.errors[:title]).to include('is too long (maximum is 250 characters)')
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'must update posts_counter' do
    post.update_post_counter
    user.reload
    expect(user.posts_counter).to eq(1)
  end

  it 'must return most recent comments' do
    first = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Tom!')
    second = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Luis!')
    third = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Ana!')
    fourth = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Gio!')
    fifth = Comment.create(post_id: post.id, author_id: user.id, text: 'Hi Gio!')
    expect(post.most_recent_comments).to eq([fifth, fourth, third, second, first])
  end
end
