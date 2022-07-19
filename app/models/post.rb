class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  after_save :increment_posts_counter

  def increment_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def last_five_comments
    comments.limit(5).order(created_at: :desc)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

