class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(params.require(:comment).permit(:text))
    comment.author_id = current_user.id
    post = Post.find(params[:post_id])
    comment.post_id = post.id
    if comment.save
      flash[:success] = 'New comment successfully added!'
      redirect_to user_post_url(current_user, post)
    else
      redirect_to new_user_post_comment_url, notice: 'Comment creation failed'
    end
  end
end
