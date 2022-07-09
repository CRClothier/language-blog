class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :increment_posts_counter

  def increment_posts_counter
    actual = user.posts_counter
    updated = actual.to_i.succ
    user.posts_counter = updated
  end

  def last_five_comments
    comments.limit(5).order(created_at: :desc)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
