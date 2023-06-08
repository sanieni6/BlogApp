require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')
  second_post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')
  third_post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post')

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'must return most recent posts' do
    expect(user.most_recent_posts).to eq([third_post, second_post, first_post])
  end
end
