class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  belongs_to :post, optional: true
  after_destroy :decrement_comment_counter
  after_create :update_comment_counter

  def update_comment_counter
    post = Post.find_by(id: post_id)
    return unless post

    post.update(comments_counter: Comment.where(post_id:).count)
  end

  def decrement_comment_counter
    post.decrement!(:comments_counter)
  end
end
