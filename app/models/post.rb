class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :likes

  def update_post_counter
    user = User.find_by(id: author_id)
    return unless user

    user.update(posts_counter: Post.where(author_id:).count)
  end

  def most_recent_comments
    Comment.where(post_id: id).order(created_at: :desc)
  end
end
