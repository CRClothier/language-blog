class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :increment_likes_counter

  def increment_likes_counter
    actual = post.likes_counter
    updated = actual.to_i.succ
    post.likes_counter = updated
  end
end
