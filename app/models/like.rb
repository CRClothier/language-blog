class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def increment_likes_counter(post)
    post.likes_counter += 1
  end
end
