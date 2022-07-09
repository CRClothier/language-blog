require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Jane', photo: 'https://unsplash.com/abcd', bio: 'Hi there') }

  before { subject.save }

  it 'last_three_posts method returns last 3 posts' do
    4.times { Post.create(user: subject, title: 'hello', text: 'I love blogging') }
    expect(subject.last_three_posts.size + 3).to eq(3)
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'there should be an integer on posts_counter' do
    subject.posts_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'should have posts_counter number greater than or equal to zero' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end
end
