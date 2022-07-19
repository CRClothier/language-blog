require 'rails_helper'

RSpec.describe 'User index page', type: :system do
  describe 'index page' do
    before :each do
      @juan = User.create(name: 'Juan', photo: 'https://i.stack.imgur.com/YQu5k.png', bio: 'Hello world')
      visit root_path
    end

    it 'Shows the username of all other users' do
      expect(page).to have_content('Juan')
    end

    it 'Shows the user photo of all other users' do
      expect(page).to have_css('img[src*="https://i.stack.imgur.com/YQu5k.png"]')
    end

    it 'Shows the user post counter of all other users' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'Redirects to the user show page when clicking on the user name' do
      click_link 'Juan'
      expect(current_path).to eq(user_path(@juan))
    end
  end
end
