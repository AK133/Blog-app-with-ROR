class AddUserIdToBlogPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :blog_posts, :user, foreign_key: true, null: true
  end
end
