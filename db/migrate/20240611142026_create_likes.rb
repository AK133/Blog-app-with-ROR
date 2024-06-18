class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :blog_post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :like_counter, default: 0
      t.timestamps
    end
  end
end
