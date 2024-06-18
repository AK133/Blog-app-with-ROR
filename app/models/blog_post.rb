class BlogPost < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :body, presence: true
    validates :image_url, allow_blank: true, format: {
    with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/,
    message: 'must be a valid URL format'
    }
    has_many :likes,dependent: :destroy
    has_many :users, through: :likes
    
    def liked_by?(user)
        likes.exists?(user: user)
    end
    def increment_like_counter
        self.increment!(:like_counter)
      end
    
    def decrement_like_counter
        self.decrement!(:like_counter)
    end
end
