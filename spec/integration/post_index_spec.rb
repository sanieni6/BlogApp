require 'rails_helper'

RSpec.describe 'Integration tests for posts', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom',
                        photo: 'https://cdna.artstation.com/p/assets/images/images/050/089/394/large/steven-lo-ji-1.jpg?1654031250&dl=1',
                        bio: 'Teacher from Mexico.')
    @first_post = Post.create(author_id: @user.id, title: 'Good job', text: 'This is my first post')
    @second_post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my second post')
    @third_post = Post.create(author_id: @user.id, title: 'Nice work', text: 'This is my third post')
    @first_comment = Comment.create(post_id: @first_post.id, author_id: @user.id, text: 'Hi Tom!')
    @second_comment = Comment.create(post_id: @second_post.id, author_id: @user.id, text: 'Hi Luis!')
    @first_like = Like.create(post_id: @first_post.id, author_id: @user.id)
    @second_like = Like.create(post_id: @second_post.id, author_id: @user.id)
    @posts = [@first_post, @second_post, @third_post]
  end

  describe 'index-Posts' do
    before { visit user_posts_path(@user) }
    it 'Check the user profile picture' do
      expect(page).to have_selector("img[src='#{@user.photo}']")
    end

    it 'Check the user name' do
      expect(page).to have_content(@user.name)
    end

    it 'Check number of posts' do
      expect(page).to have_content("Number of posts: #{@user.posts.count}")
    end

    it 'Check a post title' do
      expect(page).to have_content(@first_post.title)
    end

    it 'Check a post text' do
      expect(page).to have_content(@first_post.text)
    end

    it 'Check the first comments on a post' do
      expect(page).to have_content(@first_comment.text)
      expect(page).to have_content(@second_comment.text)
    end

    it 'Check how many comments a post has' do
      @posts.each do |post|
        expect(page).to have_content("Comments: #{post.comments_counter}")
      end
    end

    it 'Check how many likes a post has' do
      @posts.each do |post|
        expect(page).to have_content("Likes: #{post.likes.count}")
      end
    end

    it 'Check redirection to the post show page' do
      @posts.each_with_index do |post, _index|
        click_link(post.title)
        expect(page).to have_current_path(user_post_path(@user, post))
        visit user_posts_path(@user)
      end
    end
  end
end
