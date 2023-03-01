class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :update_likecounter

  private

  def update_likecounter
    post.increment!(:likes_counter)
  end
end
