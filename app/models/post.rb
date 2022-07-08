class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def increment_posts_counter(user)
    user.posts_counter += 1
  end

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
