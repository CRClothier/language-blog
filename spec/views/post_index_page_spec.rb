require 'rails_helper'

RSpec.describe 'User index page', type: :system do
  describe 'index page' do
    before :each do
      @jorge = User.create(name: 'Juan', photo: 'https://i.stack.imgur.com/YQu5k.png', bio: 'Hello world')
      @post = Post.new(user: @jorge, title: 'Test', text: 'This is the Posts page.')
      @post.save
      @comment = Comment.new(user: @jorge, post: @post, text: 'This is my first comment')
      @comment.save
      visit user_posts_path(@jorge)
    end

    it 'Shows the user photo' do
      expect(page).to have_css('img[src*="https://i.stack.imgur.com/YQu5k.png"]')
    end

    it 'Shows username ' do
      expect(page).to have_content('Juan')
    end

    it 'Shows the user post counter' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'Shows the posts title' do
      expect(page).to have_content('Test')
    end

    it 'Shows the posts body' do
      expect(page).to have_content('This is the Posts')
    end

    it 'Shows the first comment on the post' do
      expect(page).to have_content('my first comment')
    end

    it 'Shows the post comment counter' do
      expect(page).to have_content('Comments: 1')
    end

    it 'Shows the post likes counter' do
      expect(page).to have_content('Likes: 0')
    end

    it 'shows pagination' do
      expect(page).to have_content('Pagination')
    end

    it 'Redirects to the post show page when clicking on the post name' do
      click_link 'Test'
      expect(current_path).to eq(user_post_path(@jorge, @post))
    end
  end
end