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

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
