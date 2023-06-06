class AddAuthorIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_index :posts, :author_id
  end
end
