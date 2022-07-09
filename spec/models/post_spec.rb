require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'William', photo: 'https://unsplash.com/abcd', bio: 'I need a beer')

  subject { Post.new(user:, title: 'First one', text: 'text of first post') }

  before { subject.save }

  it 'increments posts_counter' do
    count = user.posts_counter
    subject.save
    expect(user.posts_counter.to_i.succ).to eq(count.to_i + 1)
  end

  it 'last_five_comments method returns last 5 comments' do
    6.times { Comment.create(user:, post: subject, text: 'hello') }
    expect(subject.last_five_comments.length + 5).to eq(5)
  end

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be longer than 250' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'should have an integer on comments_counter' do
    subject.comments_counter = 3.8
    expect(subject).to_not be_valid
  end

  it 'should have comments_counter number greater than or equal to zero' do
    subject.comments_counter = -4
    expect(subject).to_not be_valid
  end

  it 'should have an integer on likes_counter' do
    subject.likes_counter = 1.2
    expect(subject).to_not be_valid
  end
end
