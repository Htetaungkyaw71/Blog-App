class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new(author_id: current_user.id, post_id: post.id)
    return unless like.save

    redirect_to user_post_url(current_user, post)
  end
end
