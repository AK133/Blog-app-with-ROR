class Like < ApplicationRecord
  belongs_to :user
  belongs_to :blog_post

  after_create :increment_like_counter
  after_destroy :decrement_like_counter

  private

  def increment_like_counter
    blog_post.increment_like_counter
  end

  def decrement_like_counter
    blog_post.decrement_like_counter
  end
end

