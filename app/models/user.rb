class User < ApplicationRecord
  has_many :likes
  has_many :posts, foreign_key: 'author_id'
  has_many :comments

  after_save :recent_three_posts

  def recent_three_posts
    posts.last(3)
  end
end
