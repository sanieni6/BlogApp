class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  after_destroy :update_post_counter
  after_create :update_post_counter

  def update_post_counter
    user = User.find_by(id: author_id)
    return unless user

    user.update(posts_counter: Post.where(author_id:).count)
  end

  def most_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
