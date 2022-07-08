class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def increment_comments_counter(post)
    post.comments_counter += 1
  end
end
