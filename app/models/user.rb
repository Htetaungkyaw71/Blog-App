class User < ApplicationRecord
  has_many :likes
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :recent_three_posts

  def recent_three_posts
    posts.last(3)
  end
end
