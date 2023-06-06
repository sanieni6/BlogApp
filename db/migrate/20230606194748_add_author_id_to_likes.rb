class AddAuthorIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, :author_id
  end
end
