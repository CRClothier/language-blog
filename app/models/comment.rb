class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :increment_comments_counter

  def increment_comments_counter
    actual = post.comments_counter
    updated = actual.to_i.succ
    post.comments_counter = updated
  end
end
