class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  belongs_to :post, optional: true

  def update_like_counter
    post = Post.find_by(id: post_id)
    return unless post

    post.update(likes_counter: Like.where(post_id:).count)
  end
end
