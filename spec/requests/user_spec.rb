require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @user = User.create(name: 'Chris', photo: 'Photo', bio: 'Hello world')
  end
  describe 'GET /users' do
    before { get users_path }
    it 'response for index action status is correct' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'the response body of index includes correct placeholder text' do
      expect(response.body).to include('Chris')
    end
  end

  describe 'GET /users/:id' do
    before { get users_path(@user) }
    it 'response for show action status is correct' do
      expect(response).to have_http_status(200)
    end
    # it 'renders the show template' do
    #   expect(response).to render_template('show')
    # end
    it 'the response body of show includes correct placeholder text' do
      expect(response.body).to include('Chris')
    end
  end
end
