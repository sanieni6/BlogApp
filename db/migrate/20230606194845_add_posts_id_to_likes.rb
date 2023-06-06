class AddPostsIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, :post_id
  end
end
