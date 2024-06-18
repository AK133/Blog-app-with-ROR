
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blog_posts, dependent: :destroy
  has_many :likes
end
