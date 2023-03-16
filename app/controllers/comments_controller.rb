class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    post = Post.find(params[:post_id])
    @comment.post_id = post.id
    if @comment.save
      flash[:success] = 'New comment successfully added!'
      redirect_to user_post_url(current_user, post)
    else
      redirect_to new_user_post_comment_url, notice: 'Comment creation failed'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    flash[:success] = if @comment.destroy
                        'Successfully deleted'
                      else
                        'Post deletion failed'
                      end
    redirect_to user_post_url(current_user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
