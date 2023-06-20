require 'rails_helper'


RSpec.describe 'Integration tests for users', type: :feature do
  before(:each) do
      @users = User.all
  end

  describe 'index-Users' do
    before { visit users_path }

    it 'Check the username for each user' do
        @users.each do |user|
            expect(page).to have_content(user.name)
        end
    end

    it 'Check the picture for each user' do
        @users.each do |user|
            expect(page).to have_selector("img[src='#{user.photo}']")
        end
    end

    it 'number of post for each user' do
        @users.each do |user|
            expect(page).to have_content("Number of posts: #{user.posts.count}")
        end
    end

    it 'Click on the user' do
        @users.each do |user|
            click_link(user.name)
            expect(page).to have_content(user.name)
            visit users_path
        end
    end
  end
end

