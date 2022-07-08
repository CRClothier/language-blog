class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def increment_comments_counter(post)
    post.comments_counter += 1
  end
end
