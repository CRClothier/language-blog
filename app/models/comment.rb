class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :increment_comments_counter

  def increment_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
