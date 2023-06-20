require 'rails_helper'

RSpec.describe 'Integration tests for the show users path', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom',
                        photo: 'https://cdna.artstation.com/p/assets/images/images/050/089/394/large/steven-lo-ji-1.jpg?1654031250&dl=1',
                        bio: 'Teacher from Mexico.')
    @first_post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post',
                              comments_counter: 2, likes_counter: 2)
    @second_post = Post.create(author_id: @user.id, title: 'Nice', text: 'This is my second post',
                               comments_counter: 3, likes_counter: 3)
    @third_post = Post.create(author_id: @user.id, title: 'Work', text: 'This is my third post',
                              comments_counter: 4, likes_counter: 4)

    visit user_path(@user)
  end

  describe 'show-Users' do
    it 'Check the user profile picture' do
      expect(page).to have_selector("img[src='#{@user.photo}']")
    end

    it 'Check the user name' do
      expect(page).to have_content(@user.name)
    end

    it 'Check number of posts' do
      expect(page).to have_content("Number of posts: #{@user.posts.count}")
    end

    it 'check the user bio' do
      expect(page).to have_content(@user.bio)
    end

    it 'check the user first 3 posts' do
      expect(page).to have_content(@first_post.text)
      expect(page).to have_content(@second_post.text)
      expect(page).to have_content(@third_post.text)
    end

    it 'check the see all posts button' do
      expect(page).to have_link('See all posts')
    end

    it 'check redirect to the user posts index path' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end

    it 'check the redirection to the post show page' do
      click_link(@first_post.title)
      expect(page).to have_current_path(user_post_path(@user, @first_post))
    end
  end
end
