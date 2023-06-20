require 'rails_helper'

RSpec.describe 'Integration tests for the show posts path', type: :feature do
    before(:each) do
        @user = User.create(name: 'Tom', photo: 'https://cdna.artstation.com/p/assets/images/images/050/089/394/large/steven-lo-ji-1.jpg?1654031250&dl=1', bio: 'Teacher from Mexico.')
        @user2 = User.create(name: 'Luis', photo: 'https://cdna.artstation.com/p/assets/images/images/050/089/394/large/steven-lo-ji-1.jpg?1654031250&dl=1', bio: 'Teacher from Mexico.')
        @first_post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post')
        @second_post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my second post')
        @third_post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my third post')
        @first_comment = Comment.create(post_id: @first_post.id, author_id: @user2.id, text: 'Hi Tom!' )
        @second_comment = Comment.create(post_id: @first_post.id, author_id: @user2.id, text: 'Hi Luis!' )
        @first_like = Like.create(post_id: @first_post.id, author_id: @user2.id)
        @second_like = Like.create(post_id: @first_post.id, author_id: @user2.id)
        @posts = [@first_post, @second_post, @third_post]
        @comments = [@first_comment, @second_comment]
        
    end

    describe 'show-Post' do
        before { visit user_post_path(@user, @first_post) }
        it 'Check the post title' do
            expect(page).to have_content(@first_post.text)
        end

        it 'Check the writer of the post' do
            expect(page).to have_content(@user.name)
        end

        it 'Check how many comments it has' do
            expect(page).to have_content("Comments: #{@first_post.comments_counter}")
        end

        it 'Check how many likes it has' do
            expect(page).to have_content("Likes: #{@first_post.likes.count}")
        end

        it 'check the username of each commentor' do
            @comments.each do |comment|
                expect(page).to have_content(comment.author.name)
            end
        end

        it 'check the post body' do
            expect(page).to have_content(@first_post.text)
        end

        it'check the comment each commentor made' do
            @comments.each do |comment|
                expect(page).to have_content(comment.text)
            end
        end

    end
end