require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'James', photo: 'https://unsplash.com/abcd', bio: 'I love Tuna fish!')
  post = Post.create(user:, title: 'First post', text: 'Text of first post')

  subject { Comment.new(post:, user:, text: 'Great post!') }

  before { subject.save }

  it 'increments comments_counter' do
    counter = post.comments_counter
    subject.save
    expect(post.comments_counter).to eq(counter)
  end
end
