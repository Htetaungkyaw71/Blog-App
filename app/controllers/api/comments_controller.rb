class Api::CommentsController < ApplicationController
  def index
        @post = Post.find(params[:post_id]) 
        @comments = @post.comments
        render :json => @comments, status: :ok
    end

    def create
        body = JSON.parse(request.body.read)
        @post = Post.find(params[:post_id]) 
        @comment = Comment.new(author_id: User.first,post_id: @post.id,text: body['comment'])
        render :json => @comment, status: :created
    end

    private
    def comment_params
        params.require(:comment).permit(:text)
    end

end
