class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def increment_likes_counter(post)
    post.likes_counter += 1
  end
end
