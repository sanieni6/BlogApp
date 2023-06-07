class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true

  def update_comment_counter
    post = Post.find_by(id: post_id)
    return unless post

    post.update(comments_counter: Comment.where(post_id:).count)
  end
end
