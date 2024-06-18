class AddLikeCounterToBlogPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :like_counter, :integer, default: 0, null: false
  end
end
