require 'rails_helper'

RSpec.describe 'User show page', type: :system do
  describe 'index page' do
    before :each do
      @chris = User.create(name: 'Chris', photo: 'https://i.stack.imgur.com/YQu5k.png', bio: 'Hello world')
      @post = Post.create(title: 'Test', text: 'This is the Posts page.', user: @chris)
      @comment = Comment.new(user: @chris, post: @post, text: 'This is my first comment')
      @comment.save
      visit user_post_path(@chris, @post)
    end

    it 'Shows the posts title' do
      expect(page).to have_content('Test')
    end

    it 'Shows the user name' do
      expect(page).to have_content('Chris')
    end

    it 'Shows the number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    it 'Shows the post likes counter' do
      expect(page).to have_content('Likes: 0')
    end

    it 'Shows the posts body' do
      expect(page).to have_content('This is the Posts')
    end

    it 'Shows the user name of commenter' do
      expect(page).to have_content('Chris')
    end

    it 'Shows the comment content' do
      expect(page).to have_content('my first comment')
    end
  end
end