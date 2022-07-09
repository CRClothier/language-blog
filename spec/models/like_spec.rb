require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Brenda', photo: 'https://unsplash.com/', bio: 'Lounge Attendant')
  post = Post.create(user:, title: 'n1', text: 'super')

  subject { Like.new(post:, user:) }

  before { subject.save }

  it 'increments likes_counter' do
    count = post.likes_counter
    subject.save
    expect(post.likes_counter).to eq(count + 1)
  end
end