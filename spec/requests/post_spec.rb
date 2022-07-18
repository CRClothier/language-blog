require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    @user = User.create(name: 'Chris', photo: 'Photo', bio: 'Hello world')
    @post = @user.posts.create(title: 'Test', text: 'all posts for a specific user', user: @user)
  end

  describe 'GET /users/:id/posts' do
    before { get user_posts_path(@user) }
    it 'response for index action status is correct' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'the response body of index includes correct placeholder text' do
      expect(response.body).to include('all posts for a specific user')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before { get user_posts_path(@user, @post) }
    it 'response for show action status is correct' do
      expect(response).to have_http_status(200)
    end
    # it 'renders the show template' do
    #   expect(response).to render_template(:show)
    # end
    it 'the response body of show includes correct placeholder text' do
      expect(response.body).to include('Test')
    end
  end
end
