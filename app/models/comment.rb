class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  
  after_save :update_commentcounter
  after_destroy :destroy_commentcounter

  private

  def update_commentcounter
    post.increment!(:comments_counter)
  end

  def destroy_commentcounter
    post.decrement!(:comments_counter)
  end
end
