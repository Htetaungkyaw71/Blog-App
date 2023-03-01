class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :update_commentcounter

  private

  def update_commentcounter
    post.increment!(:comments_counter)
  end
end
