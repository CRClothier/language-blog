require 'rails_helper'

RSpec.describe 'User show page', type: :system do
  describe 'index page' do
    before :each do
      @chris = User.create(name: 'Chris', photo: 'https://i.stack.imgur.com/YQu5k.png', bio: 'Hello world')
      @post = Post.create(title: 'Test', text: 'This is the Posts page.', user: @chris)
      @post1 = Post.create(title: 'Test1', text: 'This is the Posts page. Test1', user: @chris)
      @post2 = Post.create(title: 'Test2', text: 'This is the Posts page. Test2', user: @chris)
      visit user_path(@chris)
    end

    it 'Shows the user photo' do
      expect(page).to have_css('img[src*="https://i.stack.imgur.com/YQu5k.png"]')
    end

    it 'Shows the user name' do
      expect(page).to have_content('Chris')
    end

    it 'Shows the user post counter' do
      expect(page).to have_content('Number of posts: 3')
    end

    it 'Shows the user bio' do
      expect(page).to have_content('Hello world')
    end

    it 'Shows the user first three posts' do
      expect(page).to have_content('Test')
      expect(page).to have_content('Test1')
      expect(page).to have_content('Test2')
    end

    it 'Shows button to see all posts' do
      expect(page).to have_link('See all posts')
    end

    it 'Redirects to the posts show page when clicking on the users post' do
      click_on 'Test1'
      expect(page).to have_current_path user_post_path(@chris, @chris.posts.second)
    end

    it 'Redirects to the posts index page when clicking on the see all posts button' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@chris)
    end
  end
end
