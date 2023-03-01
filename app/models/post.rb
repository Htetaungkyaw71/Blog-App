class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_save :update_postcounter, :recent_five_comments

  def recent_five_comments
    comments.last(5)
  end

  private

  def update_postcounter
    author.increment!(:posts_counter)
  end
end
